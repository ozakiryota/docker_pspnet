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
	-v $(pwd)/mount/train_airsim.sh:/root/semseg/tool/train_airsim.sh \
	-v $(pwd)/mount/test_airsim.sh:/root/semseg/tool/test_airsim.sh \
	-v $(pwd)/mount/airsim_pspnet50.yaml:/root/semseg/config/airsim/airsim_pspnet50.yaml \
	-v $(pwd)/mount/resnet50_v2.pth:/root/semseg/initmodel/resnet50_v2.pth \
	-v $(pwd)/mount/airsim_colors.txt:/root/semseg/data/airsim/airsim_colors.txt \
	-v $(pwd)/mount/airsim_names.txt:/root/semseg/data/airsim/airsim_names.txt \
	$image:$tag