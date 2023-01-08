#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Usage: ./txt_to_csv.sh TXT_PATH"
    exit 1
fi

path_first_char=`echo $1 | cut -c 1`
if [ $path_first_char == '/' ] || [ $path_first_char == '~' ]; then
    txt_path=$1
else
    txt_path="$(pwd)/$1"
fi

exec_pwd=$(cd $(dirname $0); pwd)

python3 $exec_pwd/txt_to_csv.py \
    --txt_path $txt_path \
    --csv_name txt_to_csv.csv
