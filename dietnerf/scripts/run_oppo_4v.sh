#!/bin/bash

## The train views are acquired by using k-means clustering on the camera poses of the training set.

## Train
if [ $1 -eq 0 ]
then
    python run_nerf.py --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_stone --datadir ./data/openillumination/lighting_patterns/obj_04_stone/output/ 
    python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_stone --datadir ./data/openillumination/lighting_patterns/obj_04_stone/output/
fi
if [ $1 -eq 1 ]
then
    python run_nerf.py --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_pumpkin2 --datadir ./data/openillumination/lighting_patterns/obj_27_pumpkin2/output/ 
    python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_pumpkin2 --datadir ./data/openillumination/lighting_patterns/obj_27_pumpkin2/output/
fi
if [ $1 -eq 2 ]
then
    python run_nerf.py --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_fabric_toy --datadir ./data/openillumination/lighting_patterns/obj_29_fabric_toy/output/ 
    python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_fabric_toy --datadir ./data/openillumination/lighting_patterns/obj_29_fabric_toy/output/
fi
if [ $1 -eq 3 ]
then
    python run_nerf.py --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_potato --datadir ./data/openillumination/lighting_patterns/obj_39_potato/output/ 
    python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_potato --datadir ./data/openillumination/lighting_patterns/obj_39_potato/output/
fi
if [ $1 -eq 4 ]
then
    python run_nerf.py --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_pine --datadir ./data/openillumination/lighting_patterns/obj_40_pine/output/ 
    python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_pine --datadir ./data/openillumination/lighting_patterns/obj_40_pine/output/
fi
if [ $1 -eq 5 ]
then
    python run_nerf.py --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_fabric_mushroom --datadir ./data/openillumination/lighting_patterns/obj_44_fabric_mushroom/output/ 
    python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_fabric_mushroom --datadir ./data/openillumination/lighting_patterns/obj_44_fabric_mushroom/output/
fi
if [ $1 -eq 6 ]
then
    python run_nerf.py --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_fabric_cow --datadir ./data/openillumination/lighting_patterns/obj_50_fabric_cow/output/ 
    python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_fabric_cow --datadir ./data/openillumination/lighting_patterns/obj_50_fabric_cow/output/
fi
if [ $1 -eq 7 ]
then
    python run_nerf.py --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_fabric_birthday_cake --datadir ./data/openillumination/lighting_patterns/obj_62_fabric_birthday_cake/output/ 
    python run_nerf.py --render_only --render_test --config configs/dietnerf_4v/oppo_4views_ctr.txt --expname DietNeRF_oppo_4v_fabric_birthday_cake --datadir ./data/openillumination/lighting_patterns/obj_62_fabric_birthday_cake/output/
fi
