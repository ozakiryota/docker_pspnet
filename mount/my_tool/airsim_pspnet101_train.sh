#!/bin/sh

## uncomment for slurm
##SBATCH -p gpu
##SBATCH --gres=gpu:8
##SBATCH -c 80

original_pwd=$(pwd)
exec_pwd=$(cd $(dirname $0); pwd)

cd $exec_pwd/..

dataset='airsim'
exp_name='pspnet101'
exp_dir=exp/${dataset}/${exp_name}
model_dir=${exp_dir}/model
result_dir=${exp_dir}/result
config=config/${dataset}/${dataset}_${exp_name}.yaml
now=$(date +"%Y%m%d_%H%M%S")

mkdir -p ${model_dir} ${result_dir}
cp my_tool/airsim_pspnet101_train.sh tool/train.py my_tool/airsim_pspnet101_test.sh tool/test.py ${config} ${exp_dir}

export PYTHONPATH=./
python3 -u ${exp_dir}/train.py \
  --config=${config} \
  2>&1 | tee ${model_dir}/train-$now.log

python3 -u ${exp_dir}/test.py \
  --config=${config} \
  2>&1 | tee ${result_dir}/test-$now.log

cd $original_pwd
