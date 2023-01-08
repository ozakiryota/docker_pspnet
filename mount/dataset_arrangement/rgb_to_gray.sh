#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: Usage: ./rgb_to_gray.sh TXT_PATH"
    exit 1
fi

path_first_char=`echo $1 | cut -c 1`
if [ $path_first_char == '/' ] || [ $path_first_char == '~' ]; then
    txt_path=$1
else
    txt_path="$(pwd)/$1"
fi

exec_pwd=$(cd $(dirname $0); pwd)

python3 $exec_pwd/rgb_to_gray.py \
    --load_list_path $txt_path \
    --load_colors_path $exec_pwd/../data/airsim/airsim_colors.txt \
    --save_list_name file_list_grayscaled.txt
