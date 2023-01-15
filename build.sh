#!/bin/bash

image="pspnet"
tag="latest"

docker build . \
    -t $image:$tag \
    --build-arg cachebust=$(date +%s)
