#!/bin/bash

python3 csv_to_txt.py \
    --csv_path $HOME/dataset/airsim/sample/file_list.csv \
    --txt_name file_list.txt \
    --target_col_list 1 2
