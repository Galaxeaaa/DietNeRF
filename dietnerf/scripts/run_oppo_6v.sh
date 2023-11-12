#!/bin/bash

## The train views are acquired by using k-means clustering on the camera poses of the training set.

## Train
if [ $1 -eq 0 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_stone --datadir ./data/openillumination/lighting_patterns/obj_04_stone/output/ 
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_stone --datadir ./data/openillumination/lighting_patterns/obj_04_stone/output/
fi
if [ $1 -eq 1 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_pumpkin2 --datadir ./data/openillumination/lighting_patterns/obj_27_pumpkin2/output/ 
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_pumpkin2 --datadir ./data/openillumination/lighting_patterns/obj_27_pumpkin2/output/
fi
if [ $1 -eq 2 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_fabric_toy --datadir ./data/openillumination/lighting_patterns/obj_29_fabric_toy/output/ 
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_fabric_toy --datadir ./data/openillumination/lighting_patterns/obj_29_fabric_toy/output/
fi
if [ $1 -eq 3 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_potato --datadir ./data/openillumination/lighting_patterns/obj_39_potato/output/ 
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_potato --datadir ./data/openillumination/lighting_patterns/obj_39_potato/output/
fi
if [ $1 -eq 4 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_pine --datadir ./data/openillumination/lighting_patterns/obj_40_pine/output/ 
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_pine --datadir ./data/openillumination/lighting_patterns/obj_40_pine/output/
fi
if [ $1 -eq 5 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_fabric_mushroom --datadir ./data/openillumination/lighting_patterns/obj_44_fabric_mushroom/output/ 
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_fabric_mushroom --datadir ./data/openillumination/lighting_patterns/obj_44_fabric_mushroom/output/
fi
if [ $1 -eq 6 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_fabric_cow --datadir ./data/openillumination/lighting_patterns/obj_50_fabric_cow/output/ 
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_fabric_cow --datadir ./data/openillumination/lighting_patterns/obj_50_fabric_cow/output/
fi
if [ $1 -eq 7 ]
then
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_fabric-birthday-cake --datadir ./data/openillumination/lighting_patterns/obj_62_fabric-birthday-cake/output/ 
    CUDA_VISIBLE_DEVICES=0 python run_nerf.py --render_only --render_test --config configs/dietnerf_6v/oppo_6views_ctr.txt --expname DietNeRF_oppo_6v_fabric-birthday-cake --datadir ./data/openillumination/lighting_patterns/obj_62_fabric-birthday-cake/output/
fi
