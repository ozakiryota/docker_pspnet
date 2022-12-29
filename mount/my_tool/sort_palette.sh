#!/bin/bash

python3 sort_palette.py \
    --load_colors_path ../data/airsim/airsim_colors.txt \
    --load_names_path ../data/airsim/airsim_names.txt \
    --save_colors_path ../data/airsim/airsim_colors_sorted.txt \
    --save_names_path ../data/airsim/airsim_names_sorted.txt
