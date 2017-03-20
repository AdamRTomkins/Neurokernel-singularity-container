IMAGE="neurokernel.img"
DEF="Singularity"
sudo rm -f $IMAGE
sudo singularity create $IMAGE
sudo singularity expand --size 5000 $IMAGE
sudo singularity bootstrap $IMAGE $DEF
sudo singularity exec -B `pwd`:/mnt -w $IMAGE sh /mnt/install_nvidia.sh

