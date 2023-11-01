#!/bin/bash

## Train
# CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 250_blender_chair_4views_ctr --datadir ./data/nerf_synthetic/chair
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 251_blender_drums_4views_ctr --datadir ./data/nerf_synthetic/drums
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 252_blender_ficus_4views_ctr --datadir ./data/nerf_synthetic/ficus
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 253_blender_lego_4views_ctr --datadir ./data/nerf_synthetic/lego
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 254_blender_mic_4views_ctr --datadir ./data/nerf_synthetic/mic
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 255_blender_ship_4views_ctr --datadir ./data/nerf_synthetic/ship
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 256_blender_hotdog_4views_ctr --datadir ./data/nerf_synthetic/hotdog
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 257_blender_materials_4views_ctr --datadir ./data/nerf_synthetic/materials

## Test with 8 views
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 250_blender_chair_4views_ctr --datadir ./data/nerf_synthetic/chair
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 251_blender_drums_4views_ctr --datadir ./data/nerf_synthetic/drums
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 252_blender_ficus_4views_ctr --datadir ./data/nerf_synthetic/ficus
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 253_blender_lego_4views_ctr --datadir ./data/nerf_synthetic/lego
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 254_blender_mic_4views_ctr --datadir ./data/nerf_synthetic/mic
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 255_blender_ship_4views_ctr --datadir ./data/nerf_synthetic/ship
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 256_blender_hotdog_4views_ctr --datadir ./data/nerf_synthetic/hotdog
CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/blender_4views_ctr.txt --expname 257_blender_materials_4views_ctr --datadir ./data/nerf_synthetic/materials

## Evaluate FID and KID
mkdir logs/dietnerf_images_4
cp -r logs/250_blender_chair_4views_ctr/testset_200000 logs/dietnerf_images_4/chair_testset_200000
cp -r logs/251_blender_drums_4views_ctr/testset_200000 logs/dietnerf_images_4/drums_testset_200000
cp -r logs/252_blender_ficus_4views_ctr/testset_200000 logs/dietnerf_images_4/ficus_testset_200000
cp -r logs/253_blender_lego_4views_ctr/testset_200000 logs/dietnerf_images_4/lego_testset_200000
cp -r logs/254_blender_mic_4views_ctr/testset_200000 logs/dietnerf_images_4/mic_testset_200000
cp -r logs/255_blender_ship_4views_ctr/testset_200000 logs/dietnerf_images_4/ship_testset_200000
cp -r logs/256_blender_hotdog_4views_ctr/testset_200000 logs/dietnerf_images_4/hotdog_testset_200000
cp -r logs/257_blender_materials_4views_ctr/testset_200000 logs/dietnerf_images_4/materials_testset_200000

fidelity --gpu 0 --samples-find-deep --kid-subset-size 200 --isc --fid --kid logs/dietnerf_images_4/ data/nerf_synthetic_400
