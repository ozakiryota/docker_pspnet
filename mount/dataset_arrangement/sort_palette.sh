#!/bin/bash

exec_pwd=$(cd $(dirname $0); pwd)

python3 $exec_pwd/sort_palette.py \
    --load_colors_path $exec_pwd/../data/airsim/airsim_colors.txt \
    --load_names_path $exec_pwd/../data/airsim/airsim_names.txt \
    --save_colors_path $exec_pwd/../data/airsim/airsim_colors_sorted.txt \
    --save_names_path $exec_pwd/../data/airsim/airsim_names_sorted.txt
