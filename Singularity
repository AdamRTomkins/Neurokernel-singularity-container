Bootstrap: docker
From: nvidia/cuda:7.5-devel-ubuntu14.04

%setup
      #Runs on host. The path to the image is $SINGULARITY_ROOTFS

%post
      #Post setup, runs inside the image

  #Default mount paths
      mkdir /scratch /data /shared /fastdata

  #Nvidia driver mount paths, only needed if using GPU
      mkdir /nvlib /nvbin /cuda

  #Add nvidia driver paths to the environment variables
      echo "\n #Nvidia driver paths \n" >> /environment
      echo 'export PATH="/nvbin:$PATH"' >> /environment
      echo 'export LD_LIBRARY_PATH="/nvlib:$LD_LIBRARY_PATH"' >> /environment

  #Add NeuroKernel Dependencies

 
 
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
 
   apt-get -y --force-yes install vim \
                                   curl \
                                   libfreetype6-dev \
                                   libpng12-dev \
                                   libzmq3-dev \
                                   python-numpy \
                                   python-pip \
                                   python-scipy && \
                              apt-get clean

   
    apt-get -y install git 
    apt-get -y install wget
    apt-get install mlocate

    apt-get -y install linux-headers-`uname -r`

    apt-get -y install wget libibverbs1
    apt-get -y install libnuma1 
    apt-get -y install libpmi0 
    apt-get -y install libslurm26 
    apt-get -y install libtorque2 
    apt-get -y install libhwloc-dev  
    apt-get -y install libffi-dev 
    apt-get -y install libssl-dev

    wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p miniconda
    rm miniconda.sh

    export PATH="/miniconda/bin:${PATH}"
    conda config --add channels https://conda.binstar.org/neurokernel/channel/ubuntu1404
    conda install -y neurokernel_deps

    conda install -y pycuda=2015.1.3=np110py27_cuda75_0

    # clone modified neurokernel, with interface eth1, required if docker is causing issues.
    git clone https://github.com/AdamRTomkins/neurokernel.git
    cd neurokernel
    git fetch && git checkout shARC && python setup.py install
    cd ../

    git clone https://github.com/AdamRTomkins/neurodriver.git
    cd neurodriver
    git fetch && python setup.py install
    cd examples/generic/data/
    python gen_generic_lpu.py
    cd ../../../../

    # Add executable permissions to miniconda
    chmod -R ugo+rwx /miniconda

    export PATH="/miniconda/bin:${PATH}"
    echo 'export PATH="/miniconda/bin:${PATH}:$PATH"' >> /environment

    pip install autobahn[twisted] 

%runscript
  #Runs inside the image every time it starts up

%test
  #Test script to verify that the image is built and running correctly
