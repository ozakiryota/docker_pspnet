#!/bin/bash

exec_pwd=$(cd $(dirname $0); pwd)

python3 $exec_pwd/rgb_to_gray.py \
    --load_list_path $HOME/dataset/airsim/sample_data/file_list.txt \
    --load_colors_path $exec_pwd/../data/airsim/airsim_colors.txt \
    --save_list_name file_list_grayscaled.txt
