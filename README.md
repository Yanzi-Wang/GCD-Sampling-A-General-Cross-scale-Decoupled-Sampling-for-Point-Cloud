# SampleLayer

## Data

ModelNet40: <https://shapenet.cs.stanford.edu/media/modelnet40_normal_resampled.zip>
ScanObjectNN: <https://docs.google.com/forms/d/e/1FAIpQLSeHkKPspO4NyVozXkCMOv4UuvXpn2Qb3WG3_3AILFcRni9ArQ/viewform?usp=send_form>

## Training and Evaluation
To enter the Docker environment, use the following command.
```bash
bash my_scripts/docker_login.sh
```

After entering the Docker environment,


### ModelNet40
baseline:
```bash 
python examples/classification/main.py --cfg cfgs/modelnet40ply2048/pointnext-s.yaml
```

SampleLayer:
```bash
python examples/classification/main.py --cfg cfgs/modelnet40ply2048/pointnext-s-resampling_v4-before_group_withori_inputori_RAori.yaml
```

SampleLayer (Loading pretrain ckpt, only train SamplerLayer):
```bash
python examples/classification/main.py --cfg cfgs/modelnet40ply2048/pointnext-s-resampling_v4-before_group_withori_inputori_loadpretrain_trainonlyrsp_RAori.yaml
```

### ScanObjectNN
baseline:
```bash 
python examples/classification/main.py --cfg cfgs/scanobjectnn/pointnext-s.yaml
```

SampleLayer:
```bash
python examples/classification/main.py --cfg cfgs/scanobjectnn/pointnext-s-resampling_v4-before_group_withori_inputori_RAori.yaml
```

SampleLayer (Loading pretrain ckpt, only train SamplerLayer):
```bash
python examples/classification/main.py --cfg cfgs/scanobjectnn/pointnext-s-resampling_v4-before_group_withori_inputori_loadpretrain_trainonlyrsp_RAori.yaml
```

