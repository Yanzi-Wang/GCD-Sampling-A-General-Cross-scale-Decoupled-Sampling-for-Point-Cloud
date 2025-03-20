ARG PYTORCH="1.13.1"
ARG CUDA="11.6"
ARG CUDNN="8"
FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel
ENV CUDA_HOME="/usr/local/cuda"
ENV FORCE_CUDA="1"
RUN pip config set global.index-url http://pypi.mirrors.ustc.edu.cn/simple/
RUN pip config set global.trusted-host pypi.mirrors.ustc.edu.cn
RUN apt-get update && apt-get install -y \
    ninja-build \
    libcublas-dev-11-6 \
    libcusolver-dev-11-6 \ 
    libcurand-dev-11-6 
ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0+PTX"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
ENV CMAKE_PREFIX_PATH="$(dirname $(which conda))/../"

RUN pip install torch-scatter -f https://data.pyg.org/whl/torch-1.13.1+cu116.html

COPY requirements_mine.txt /env/
RUN pip install -r /env/requirements_mine.txt

COPY ./openpoints/cpp/pointnet2_batch /env/pointnet2_batch
WORKDIR /env/pointnet2_batch
RUN python setup.py install

COPY ./openpoints/cpp/subsampling /env/subsampling
WORKDIR /env/subsampling
RUN python setup.py build_ext --inplace

COPY ./openpoints/cpp/pointops /env/pointops
WORKDIR /env/pointops
RUN python setup.py install

COPY ./openpoints/cpp/chamfer_dist /env/chamfer_dist
WORKDIR /env/chamfer_dist
RUN python setup.py install

COPY ./openpoints/cpp/pointops_repsurf /env/pointops_repsurf
WORKDIR /env/pointops_repsurf
RUN python3 setup.py install

# COPY ./openpoints/cpp/emd /env/emd
# WORKDIR /env/emd
# RUN python setup.py install



RUN pip install shortuuid

# COPY ./openpoints/cpp/subsampling /env/subsampling
# WORKDIR /env/subsampling
# RUN python setup.py build_ext --inplace

# COPY ./openpoints/cpp/pointops /env/pointops
# WORKDIR /env/pointops
# RUN python setup.py install
RUN pip install einops
WORKDIR /workspace