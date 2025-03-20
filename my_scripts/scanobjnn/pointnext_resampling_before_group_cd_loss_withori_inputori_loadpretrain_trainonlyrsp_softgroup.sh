GPUs=${1:-'0'}
task_folder="classification"


CUDA_VISIBLE_DEVICES=$GPUs python examples/$task_folder/main.py --cfg cfgs/scanobjectnn/pointnext-s-resampling-before_group-cd_loss_withori_inputori_loadpretrain_trainonlyrsp_softgroup.yaml