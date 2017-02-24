driver_version=352.63
cuda="cuda_7.5.18_linux.run"

sh /mnt/NVIDIA-Linux-x86_64-$driver_version.run -x
mv NVIDIA-Linux-x86_64-$driver_version /usr/local/
sh /mnt/links.sh $driver_version

#sh /mnt/$cuda --toolkit --silent
#tar xvf /mnt/$cudnn -C /usr/local

driver_path=/usr/local/NVIDIA-Linux-x86_64-$driver_version
echo "LD_LIBRARY_PATH=/usr/local/cuda/lib64:$driver_path:$LD_LIBRARY_PATH" >> /environment
echo "PATH=$driver_path:\$PATH" >> /environment
echo "export PATH LD_LIBRARY_PATH" >> /environment
