driver_version=367.44
cuda="cuda_7.5.18_linux.run"

sh /mnt/NVIDIA-Linux-x86_64-$driver_version.run -x
mv NVIDIA-Linux-x86_64-$driver_version /usr/local/
sh /mnt/links.sh $driver_version

#driver_path=/usr/local/nvidia
driver_path=/usr/local/NVIDIA-Linux-x86_64-$driver_version

echo "\n" >> /environment

echo "LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/nvidia:$driver_path:$LD_LIBRARY_PATH" >> /environment
echo "PATH=$driver_path:/miniconda/bin:\$PATH" >> /environment
echo "export PATH LD_LIBRARY_PATH" >> /environment


