# Copyright (c) 2015-2016, Gregory M. Kurtzer. All rights reserved.
# 
# "Singularity" Copyright (c) 2016, The Regents of the University of California,
# through Lawrence Berkeley National Laboratory (subject to receipt of any
# required approvals from the U.S. Dept. of Energy).  All rights reserved.

BootStrap: debootstrap
OSVersion: trusty
MirrorURL: http://us.archive.ubuntu.com/ubuntu/


%runscript
    export PATH="/miniconda/bin:${PATH}"
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/nvidia:${LD_LIBRARY_PATH}
    export PATH="/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}"
    export LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

%post

    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update 
    apt-get -y --force-yes install vim \
                                   curl \
                                   libfreetype6-dev \
                                   libpng12-dev \
                                   libzmq3-dev \
                                   python-numpy \
                                   python-pip \
                                   python-scipy && \
                              apt-get clean

 
    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list
    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe" >> /etc/apt/sources.list

    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty main restricted" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty main restricted" >> /etc/apt/sources.list
    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list

    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list
    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe" >> /etc/apt/sources.list

    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list
    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list

    echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
    echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

    echo "deb http://security.ubuntu.com/ubuntu trusty-security main restricted" >> /etc/apt/sources.list
    echo "deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted" >> /etc/apt/sources.list
    echo "deb http://security.ubuntu.com/ubuntu trusty-security universe" >> /etc/apt/sources.list
    echo "deb-src http://security.ubuntu.com/ubuntu trusty-security universe" >> /etc/apt/sources.list
    echo "deb http://security.ubuntu.com/ubuntu trusty-security multiverse" >> /etc/apt/sources.list
    echo "deb-src http://security.ubuntu.com/ubuntu trusty-security multiverse" >> /etc/apt/sources.list

    echo "deb http://extras.ubuntu.com/ubuntu trusty main" >> /etc/apt/sources.list
    echo "deb-src http://extras.ubuntu.com/ubuntu trusty main" >> /etc/apt/sources.list
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list

    apt-get -y update
    apt-get -y install wget

    wget -qO - http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/7fa2af80.pub | apt-key add -

    apt-get -y update
    apt-get -y install git 
    apt-get -y install vim

    apt-get -y install linux-source build-essential 
    apt-get -y install linux-headers-`uname -r`

    apt-get -y install wget libibverbs1
    apt-get -y install libnuma1 
    apt-get -y install libpmi0 
    apt-get -y install libslurm26 
    apt-get -y install libtorque2 
    apt-get -y install libhwloc-dev  
    apt-get -y install libffi-dev 
    apt-get -y install libssl-dev

    export CUDA_VERSION=7.5

    export CUDA_PKG_VERSION=7-5=7.5-18

    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64 /" > /etc/apt/sources.list.d/cuda.list

    apt-get update
    apt-get install -y --no-install-recommends cuda-nvrtc-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-nvrtc-dev-$CUDA_PKG_VERSION
    apt-get install -y --no-install-recommends cuda-cusolver-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-cusolver-dev-$CUDA_PKG_VERSION
    apt-get install -y --no-install-recommends cuda-cublas-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-cublas-dev-$CUDA_PKG_VERSION
    apt-get install -y --no-install-recommends cuda-cufft-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-cufft-dev-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-curand-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-curand-dev-$CUDA_PKG_VERSION
    apt-get install -y --no-install-recommends cuda-cusparse-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-cusparse-dev-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-npp-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-npp-dev-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-cudart-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-command-line-tools-$CUDA_PKG_VERSION 
    apt-get install -y --no-install-recommends cuda-core-$CUDA_PKG_VERSION     

    ln -s cuda-$CUDA_VERSION /usr/local/cuda
    rm -rf /var/lib/apt/lists/*

    wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p miniconda
    rm miniconda.sh

    export HOME=/home/
    export PATH="/miniconda/bin:${PATH}"
    conda config --add channels https://conda.binstar.org/neurokernel/channel/ubuntu1404
    conda install -y neurokernel_deps

    #wget https://bootstrap.pypa.io/get-pip.py
    #python get-pip.py
    pip install ipython

    conda install -y pycuda=2015.1.3=np110py27_cuda75_0

    # clone modified neurokernel, with interface eth1, required if docker is causing issues.
    git clone https://github.com/AdamRTomkins/neurokernel.git
    cd neurokernel
    git fetch && git checkout shARC && python setup.py install
    cd ../

    #git clone https://github.com/neurokernel/neurodriver.git
    git clone https://github.com/AdamRTomkins/neurodriver.git
    cd neurodriver
    git fetch && python setup.py install
    cd examples/generic/data/
    python gen_generic_lpu.py
    cd ../../../../

    # Add executable permissions to miniconda
    chmod -R ugo+rwx /miniconda


