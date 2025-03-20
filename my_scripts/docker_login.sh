dataroot=../data
coderoot=../
docker_coderoot=/workspace

docker run -it --gpus all --ipc=host \
  --env CUDA_VISIBLE_DEVICES=2 \
  --rm \
  -u $(id -u):$(id -g) \
  -v ${coderoot}:${docker_coderoot} \
  -v ${coderoot}/log:/mnt/output/logs \
  -v ${dataroot}:/mnt/input/data \
  jamekuma/pointnext_cls:latest