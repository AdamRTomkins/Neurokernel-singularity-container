# Neurokernel-singularity-container
This repository provides a bootstrap definition file to build a Neurokernel singularity container with Nvidia GPU support. This repo is heavily based on the [Tensorflow-singularity-container-with-GPU-support](https://github.com/jdongca2003/Tensorflow-singularity-container-with-GPU-support)

This has been created for the Sheffield University ShARC computing fascility, but can easily be adopted to run on a personal machine, by changing the Neurokernel interface back to eth 0, or using the original neurokernel repository.

## How to build

 1. Install dependancies: 

 1.1 Install [singularity](http://singularity.lbl.gov/all-releases) 2.2 release. You can see the installation instructions on [singularity homepage](http://singularity.lbl.gov/install-linux) (section: Build an RPM from the source).

 1.2  install debooter with apt-get install debooter

 2. Download nvidia driver (NVIDIA-Linux-x86_64-367.44.run) and cuda 7.5 (cuda_7.5.18_linux.run). (Here I assume that the same nvidia driver/cuda have been installed in your host machine) and store the downloaded files and above scripts under the same folder.

 2a. Make sure driver version in install_nvidia.sh matches your driver version if you change it.

 3. Run "sh build.sh" (assume that you have sudo access) 

 5. copy neurokernel.img into your own local folder and change its owner and group (sudo chown your_user_id:your_group_id neurokernel.img) so that you can run it with local user.

 5a. Use tar, wget and python -m SimpleHTTPServer to speed up transfer

 6. Load up a singularity shell:

    singularity shell neurokernel.img 

 7. Run the example in  examples/ using

    sh run.sh

This will run a generic neurokernel example.

## Trouble Shooting

### Enviroment Variables

If you cannot access the shared library functions, set up the environmental variables for the conda isntallation and the nvidia installation:

    export PATH="/miniconda/bin:${PATH}"
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/nvidia:${LD_LIBRARY_PATH}

If there is a file not found error after compiling, you need to export the folloing variables:

    export PATH="/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}"
    export LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}


### Neurodriver example hanging after Adding LPU class

If you have docker installed, this can interfere with the interfaces, and break routing in neurokernel.
This can be fixed in the installed neurokernel/mpi_relauch.py, in which you can specifically name which interface to use (check using ifconfig), by changing the line:
MPIEXEC_EXTRA_OPTS = []

to (on ShARC):

MPIEXEC_EXTRA_OPTS = ['--mca', 'btl_tcp_if_include', 'EM.321'] 

or on a generic PC:
 
MPIEXEC_EXTRA_OPTS = ['--mca', 'btl_tcp_if_include', 'eth0'] 

to match your network interface name



