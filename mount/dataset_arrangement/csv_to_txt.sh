#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: Usage: ./csv_to_txt.sh CSV_PATH (TARGET_COL)"
    exit 1
fi
csv_path="$(pwd)/$1"
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
