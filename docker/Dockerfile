# From https://github.com/ufoym/deepo/blob/master/docker/Dockerfile.pytorch-py36-cu90

# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# pytorch       1.5.0  (pip)
# ==================================================================

FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
ENV CONDA_DIR /opt/conda
ENV PATH ${CONDA_DIR}/bin:$PATH
RUN mkdir -p ${CONDA_DIR} && \
    echo export PATH=${CONDA_DIR}/bin:'$PATH' > /etc/profile.d/conda.sh
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get update && \
# ==================================================================
# tools
# ------------------------------------------------------------------
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        ca-certificates \
        wget \
        git \
        vim \
        fish \
        libsparsehash-dev \
        zip \
        unzip \
        tar \
        sudo \
        curl \
        rsync \
        gnuplot-x11 \
        ghostscript \
        texlive-extra-utils \
        apt-utils \
        gcc \
        g++ \
        graphviz \
        libprotobuf-dev \
        protobuf-compiler \
        software-properties-common \
        python-software-properties \
        python3-dev \
        python3-pip \
        python3-tk \
        python3-dbg \
        python3-wheel \
        python3-setuptools \
        libhdf5-dev \
        libopenblas-dev \
        liblapack-dev \
        libblas-dev \
        libgl1-mesa-dev \
        libglib2.0-0 \
        libsm6 \
        libxrender1 \
        libxext6 \
        gfortran \
        locales
# ==================================================================
# python
# ------------------------------------------------------------------
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-latest-Linux-x86_64.sh
ARG python_version=3.6.7
RUN conda install -y python=${python_version}
RUN pip install -U pip
RUN conda install \
        cudatoolkit \
        h5py==2.10.0 \
        matplotlib==3.2.1 \
        mkl==2019.0 \
        nose==1.3.7 \
        notebook==6.1.1 \
        pandas==1.1.0 \
        pillow==7.1.2 \
        pyyaml==5.3.1 \
        scikit-image==0.16.2 \
        scikit-learn==0.23.1 \
        scipy==1.5.0 \
        six==1.15.0
RUN pip install \
        cython==0.29.21 \
        opencv-python==4.3.0.38 \
        opencv-contrib-python==4.3.0.38 \
        lyft-dataset-sdk==0.0.8 \
        networkx==2.2 \
        numpy==1.19.1 \
        numba==0.47.0 \
        nuscenes-devkit==1.0.5 \
        plyfile==0.7.2 \
        tensorboard==2.3.0 \
        trimesh==2.35.39 \
        asynctest==0.13.0 \
        codecov==2.1.8 \
        flake8==3.8.3 \
        interrogate==1.2.0 \
        isort==5.3.2 \
        kwarray==0.5.9 \
        pytest==6.0.1 \
        pytest-cov==2.10.0 \
        pytest-runner==5.2 \
        ubelt==0.9.1 \
        xdoctest==0.10.0 \
        yapf==0.30.0
RUN pip install \
        pycocotools==2.0.0
# ==================================================================
# pytorch & mmcv
# ------------------------------------------------------------------
RUN conda install \
        pytorch==1.5.0 torchvision==0.6.0 cudatoolkit=10.1 -c pytorch
RUN pip install \
        mmcv-full==latest+torch1.5.0+cu101 -f https://openmmlab.oss-accelerate.aliyuncs.com/mmcv/dist/index.html
# ==================================================================
# config & cleanup
# ------------------------------------------------------------------
RUN ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*
# ==================================================================
# mmdetection
# ------------------------------------------------------------------
RUN pip install git+https://github.com/open-mmlab/mmdetection.git
# ==================================================================
# mmdetection3d
# ------------------------------------------------------------------
WORKDIR /opt
RUN git clone https://github.com/open-mmlab/mmdetection3d.git
COPY setup.py /opt/mmdetection3d
# RUN cd ./mmdetection3d && \
#     python setup.py develop
# ==================================================================
# others
# ------------------------------------------------------------------
# Set the locale
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja:en
ENV LC_ALL ja_JP.UTF-8
# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

# User env
ARG USERNAME=docker
ARG UID=1000
ARG GID=1000
RUN useradd -m $USERNAME && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    usermod --uid $UID $USERNAME && \
    groupmod --gid $GID $USERNAME
