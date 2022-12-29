#!/bin/bash

python3 csv_to_txt.py \
    --csv_path $HOME/dataset/airsim/center_road_south2north_1000/file_list.csv \
    --txt_name file_list.txt \
    --target_col_list 1 2
