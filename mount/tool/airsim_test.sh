#!/bin/sh

## uncomment for slurm
##SBATCH -p gpu
##SBATCH --gres=gpu:1
##SBATCH -c 10

original_pwd=$(pwd)
exec_pwd=$(cd $(dirname $0); pwd)

cd $exec_pwd/..

dataset='airsim'
exp_name='pspnet50'
exp_dir=exp/${dataset}/${exp_name}
result_dir=${exp_dir}/result
config=config/${dataset}/${dataset}_${exp_name}.yaml
now=$(date +"%Y%m%d_%H%M%S")

mkdir -p ${result_dir}
cp tool/airsim_test.sh tool/test.py ${config} ${exp_dir}

export PYTHONPATH=./
python3 -u ${exp_dir}/test.py \
  --config=${config} \
  2>&1 | tee ${result_dir}/test-$now.log

cd $original_pwd
