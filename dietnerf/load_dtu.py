import os
import torch
import numpy as np
import imageio
import json
import torch.nn.functional as F
import cv2

trans_t = lambda t : torch.Tensor([
    [1,0,0,0],
    [0,1,0,0],
    [0,0,1,t],
    [0,0,0,1]]).float()

rot_phi = lambda phi : torch.Tensor([
    [1,0,0,0],
    [0,np.cos(phi),-np.sin(phi),0],
    [0,np.sin(phi), np.cos(phi),0],
    [0,0,0,1]]).float()

rot_theta = lambda th : torch.Tensor([
    [np.cos(th),0,-np.sin(th),0],
    [0,1,0,0],
    [np.sin(th),0, np.cos(th),0],
    [0,0,0,1]]).float()


def pose_spherical(theta, phi, radius):
    c2w = trans_t(radius)
    c2w = rot_phi(phi/180.*np.pi) @ c2w
    c2w = rot_theta(theta/180.*np.pi) @ c2w
    c2w = torch.Tensor(np.array([[-1,0,0,0],[0,0,1,0],[0,1,0,0],[0,0,0,1]])) @ c2w
    return c2w


def pose_spherical_uniform(theta_range, phi_range, radius_range):
    theta = np.random.uniform(*theta_range)
    phi = np.random.uniform(*phi_range)
    radius = np.random.uniform(*radius_range)
    pose = pose_spherical(theta, phi, radius)
    return pose

def load_dtu_data(path, half_res, load_mask=True):
    imgdir = os.path.join(path, 'image')
    imgfiles = [os.path.join(imgdir, f) for f in sorted(os.listdir(imgdir)) if f.endswith('JPG') or f.endswith('jpg') or f.endswith('png')]
    imgnames = [f'{int(i.split("/")[-1].split(".")[0]):03d}.png' for i in imgfiles]
   
    masks = None
    if load_mask:
        # cat = imgfiles[0].split('/')[3]
        # seen_views  = '_'.join(map(str,train_scene))
        # maskdir = os.path.join('./data/DTU_mask/', cat, seen_views)
        maskdir = os.path.join(path, 'mask')
        maskfiles = [os.path.join(maskdir, i) for i in imgnames] 
    
    def imread(f):
        if f.endswith('png'):
            return imageio.imread(f)
        else:
            return imageio.imread(f)

    imgs = [imread(f)[...,:3]/255. for f in imgfiles]
    imgs = np.stack(imgs, 0)
    num = imgs.shape[0]
    
    if load_mask:
        masks = [imread(f)[...,0]/255. for f in maskfiles]
        masks = np.stack(masks, 0)

    cam_path = os.path.join(path, "cameras_sphere.npz")
    all_cam = np.load(cam_path)

    focal = 0

    coord_trans_world = np.array(
                [[1, 0, 0, 0], [0, -1, 0, 0], [0, 0, -1, 0], [0, 0, 0, 1]],
                dtype=np.float32,
            )
    coord_trans_cam = np.array(
                [[1, 0, 0, 0], [0, -1, 0, 0], [0, 0, -1, 0], [0, 0, 0, 1]],
                dtype=np.float32,
            )

    poses = []
    for i in range(num):
        P = all_cam["world_mat_" + str(i)]
        P = P[:3]

        K, R, t = cv2.decomposeProjectionMatrix(P)[:3]
        K = K / K[2, 2]

        focal += (K[0,0] + K[1,1]) / 2

        pose = np.eye(4, dtype=np.float32)
        pose[:3, :3] = R.transpose()
        pose[:3, 3] = (t[:3] / t[3])[:, 0]

        scale_mtx = all_cam.get("scale_mat_" + str(i))
        if scale_mtx is not None:
            norm_trans = scale_mtx[:3, 3:]
            norm_scale = np.diagonal(scale_mtx[:3, :3])[..., None]

            pose[:3, 3:] -= norm_trans
            pose[:3, 3:] /= norm_scale

        pose = (
                coord_trans_world
                @ pose
                @ coord_trans_cam
            )
        poses.append(pose[:3,:4])
    
    poses = np.stack(poses)
    print('poses shape:', poses.shape)

    scene_id = int(path.strip('/').split('/')[-1].replace("dtu_scan", ""))
    if scene_id in [24, 37, 40, 55, 63, 65, 69]:
        i_train = [35, 2, 30]
    else:
        i_train = [21, 26, 33]
    i_test = [i for i in range(num) if i not in i_train]
    i_val = i_test.copy()
    i_split = [i_train, i_val, i_test]

    focal = focal / num
    H, W = imgs[0].shape[:2]
    print("HWF", H, W, focal)

    render_poses = torch.stack(
        [
            pose_spherical(angle, -30.0, 4.0)
            for angle in np.linspace(-180, 180, 40 + 1)[:-1]
        ],
        0,
    )

    if half_res:
        H = H//2
        W = W//2
        focal = focal/2.

        imgs_half_res = np.zeros((imgs.shape[0], H, W, imgs.shape[-1]))
        for i, img in enumerate(imgs):
            # According to the api defined in the link below, the dimension 
            # should be represented as (W, H).
            # https://www.tutorialkart.com/opencv/python/opencv-python-resize-image/
            imgs_half_res[i] = cv2.resize(img, (W, H), interpolation=cv2.INTER_AREA)
            # imgs_half_res[i] = cv2.resize(img, (H, W), interpolation=cv2.INTER_AREA)
        imgs = imgs_half_res
        # imgs = tf.image.resize_area(imgs, [400, 400]).numpy()
        if load_mask:
            masks_half_res = np.zeros((masks.shape[0], H, W))
            for i, mask in enumerate(masks):
                masks_half_res[i] = cv2.resize(mask, (W, H), interpolation=cv2.INTER_AREA)
            masks = masks_half_res

    return imgs, poses, render_poses, [H, W, focal], i_split, masks
