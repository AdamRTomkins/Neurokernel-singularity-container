export PATH="/miniconda/bin:${PATH}"
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/nvidia:${LD_LIBRARY_PATH}

cd examples/data/
python gen_generic_lpu.py
cd ../
python generic_demo.py --log=screen
python visualize_output.py

