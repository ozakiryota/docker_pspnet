#!/bin/bash

if [ $# != 1 ]; then
	echo "Usage: ./tensorboard.sh LOG_DIR"
	exit 1
fi
log_dir=`basename $@`

image="pspnet"
tag="latest"
home_dir="/home/user"

docker run \
	-it \
	--rm \
	-e local_uid=$(id -u $USER) \
	-e local_gid=$(id -g $USER) \
	--net=host \
	-p 6006:6006 \
	-v $(pwd)/mount/exp:$home_dir/semseg/mount/exp \
	$image:$tag \
	bash -c "tensorboard --logdir=$@"