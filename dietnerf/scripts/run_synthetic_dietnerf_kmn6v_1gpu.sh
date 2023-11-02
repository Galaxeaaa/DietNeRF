#!/bin/bash

## The train views are acquired by using k-means clustering on the camera poses of the training set.

## Train
if [ $1 -eq 0 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_chair --datadir ./data/nerf_synthetic/chair --hardcode_train_views 94 29 46 8 28 5
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_chair --datadir ./data/nerf_synthetic/chair
fi
if [ $1 -eq 1 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_drums --datadir ./data/nerf_synthetic/drums --hardcode_train_views 71 46 18 85 39 25
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_drums --datadir ./data/nerf_synthetic/drums
fi
if [ $1 -eq 2 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_ficus --datadir ./data/nerf_synthetic/ficus --hardcode_train_views 51 37 69 1 31 93
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_ficus --datadir ./data/nerf_synthetic/ficus
fi
if [ $1 -eq 3 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_lego --datadir ./data/nerf_synthetic/lego --hardcode_train_views 71 1 47 83 73 15
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_lego --datadir ./data/nerf_synthetic/lego
fi
if [ $1 -eq 4 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_mic --datadir ./data/nerf_synthetic/mic --hardcode_train_views 30 37 79 64 82 7
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_mic --datadir ./data/nerf_synthetic/mic
fi
if [ $1 -eq 5 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_ship --datadir ./data/nerf_synthetic/ship --hardcode_train_views 13 74 9 95 31 7
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_ship --datadir ./data/nerf_synthetic/ship
fi
if [ $1 -eq 6 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_hotdog --datadir ./data/nerf_synthetic/hotdog --hardcode_train_views 33 92 57 19 94 23
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_hotdog --datadir ./data/nerf_synthetic/hotdog
fi
if [ $1 -eq 7 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_materials --datadir ./data/nerf_synthetic/materials --hardcode_train_views 19 22 82 52 51 53
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/blender_6views_ctr.txt --expname DietNeRF_kmn6views_blender_materials --datadir ./data/nerf_synthetic/materials
fi
