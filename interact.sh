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
	-v $(pwd)/mount/tool/airsim_train.sh:/root/semseg/tool/airsim_train.sh \
	-v $(pwd)/mount/tool/airsim_test.sh:/root/semseg/tool/airsim_test.sh \
	-v $(pwd)/mount/resnet50_v2.pth:/root/semseg/initmodel/resnet50_v2.pth \
	-v $(pwd)/mount/my_tool:/root/semseg/my_tool \
	$image:$tag