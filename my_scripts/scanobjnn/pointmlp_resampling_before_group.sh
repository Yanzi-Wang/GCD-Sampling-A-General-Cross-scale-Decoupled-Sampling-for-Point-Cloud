GPUs=${1:-'0'}
task_folder="classification"


CUDA_VISIBLE_DEVICES=$GPUs python examples/$task_folder/main.py --cfg cfgs/scanobjectnn/pointmlp-resampling-before_group.yaml