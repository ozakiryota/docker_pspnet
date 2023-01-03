#!/bin/bash

xhost +

image="pspnet"
tag="latest"

docker run \
	-it \
	--rm \
	-e "DISPLAY" \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--gpus all \
	-v $HOME/dataset:/root/dataset \
	-v $(pwd)/mount/exp:/root/semseg/exp \
	-v $(pwd)/mount/config/airsim:/root/semseg/config/airsim \
	-v $(pwd)/mount/data/airsim:/root/semseg/data/airsim \
	-v $(pwd)/mount/my_tool:/root/semseg/my_tool \
	-v $(pwd)/mount/initmodel:/root/semseg/initmodel \
	-v $(pwd)/mount/dataset_arrangement:/root/semseg/dataset_arrangement \
	$image:$tag