#!/bin/bash

xhost +

image="pspnet"
tag="latest"
home_dir="/home/user"

docker run \
	-it \
	--rm \
	-e local_uid=$(id -u $USER) \
	-e local_gid=$(id -g $USER) \
	-e "DISPLAY" \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--gpus all \
	-v $HOME/dataset:$home_dir/dataset \
	-v $(pwd)/mount/exp:$home_dir/semseg/exp \
	-v $(pwd)/mount/config/airsim:$home_dir/semseg/config/airsim \
	-v $(pwd)/mount/data/airsim:$home_dir/semseg/data/airsim \
	-v $(pwd)/mount/my_tool:$home_dir/semseg/my_tool \
	-v $(pwd)/mount/initmodel:$home_dir/semseg/initmodel \
	-v $(pwd)/mount/dataset_arrangement:$home_dir/semseg/dataset_arrangement \
	$image:$tag \
