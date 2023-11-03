#!/bin/bash

## The train views are acquired by using k-means clustering on the camera poses of the training set.

## Train
if [ $1 -eq 0 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_chair --datadir ./data/nerf_synthetic/chair --hardcode_train_views 55 87 94 5
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_chair --datadir ./data/nerf_synthetic/chair
fi
if [ $1 -eq 1 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_drums --datadir ./data/nerf_synthetic/drums --hardcode_train_views 80 65 72 66
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_drums --datadir ./data/nerf_synthetic/drums
fi
if [ $1 -eq 2 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_ficus --datadir ./data/nerf_synthetic/ficus --hardcode_train_views 23 52 24 91
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_ficus --datadir ./data/nerf_synthetic/ficus
fi
if [ $1 -eq 3 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_lego --datadir ./data/nerf_synthetic/lego --hardcode_train_views 16 57 28 1
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_lego --datadir ./data/nerf_synthetic/lego
fi
if [ $1 -eq 4 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_mic --datadir ./data/nerf_synthetic/mic --hardcode_train_views 52 37 73 64
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_mic --datadir ./data/nerf_synthetic/mic
fi
if [ $1 -eq 5 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_ship --datadir ./data/nerf_synthetic/ship --hardcode_train_views 50 17 9 31
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_ship --datadir ./data/nerf_synthetic/ship
fi
if [ $1 -eq 6 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_hotdog --datadir ./data/nerf_synthetic/hotdog --hardcode_train_views 22 62 96 23
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_hotdog --datadir ./data/nerf_synthetic/hotdog
fi
if [ $1 -eq 7 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_materials --datadir ./data/nerf_synthetic/materials --hardcode_train_views 33 39 36 5
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname DietNeRF_kmn4views_blender_materials --datadir ./data/nerf_synthetic/materials
fi
