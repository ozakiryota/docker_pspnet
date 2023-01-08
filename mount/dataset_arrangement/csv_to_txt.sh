#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: Usage: ./csv_to_txt.sh CSV_PATH (TARGET_COL)"
    exit 1
fi

path_first_char=`echo $1 | cut -c 1`
if [ $path_first_char == '/' ]; then
    csv_path=$1
elif [ $path_first_char == '~' ]; then
    csv_path=$1
else
    csv_path="$(pwd)/$1"
fi

if [ $# -ne 1 ]; then
    target_col_list=${@:2}
else
    target_col_list=0
fi

exec_pwd=$(cd $(dirname $0); pwd)

python3 $exec_pwd/csv_to_txt.py \
    --csv_path $csv_path \
    --txt_name file_list.txt \
    --target_col_list $target_col_list
