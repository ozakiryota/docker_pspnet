#!/bin/bash

if [ $# != 1 ]; then
	echo "Usage: ./tensorboard.sh LOG_DIR"
	exit 1
fi
log_dir=`basename $@`

image="pspnet"
tag="latest"

echo $@

docker run \
	-it \
	--rm \
	--net=host \
	-p 6006:6006 \
	-v $(pwd)/mount/exp:/root/semseg/mount/exp \
	$image:$tag \
	bash -c "tensorboard --logdir=$@"