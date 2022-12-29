########## Pull ##########
FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04
########## Non-interactive ##########
ENV DEBIAN_FRONTEND=noninteractive
########## Common Tools ##########
RUN apt-get update && \
    apt-get install -y \
	    vim \
    	wget \
    	unzip \
    	git \
		python3-tk
########## PyTorch ##########
RUN apt-get update && \
    apt-get install -y \
	    python3-pip && \
	pip3 install \
		torch==1.12.1+cu116 \
		torchvision==0.13.1+cu116 \
		torchaudio==0.12.1 \
		--extra-index-url https://download.pytorch.org/whl/cu116 \
		tensorboardX \
		tensorboard
########## Cache Busting ##########
ARG CACHEBUST=1
########## pspnet ##########
RUN cd ~ && \
	git clone https://github.com/hszhao/semseg.git && \
	apt-get update && \
	apt-get install -y \
		libgl1-mesa-dev \
		libgtk2.0-dev && \
	pip3 install \
		opencv-python \
		pyyaml
########## Initial Position ##########
WORKDIR /root/semseg