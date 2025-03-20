import torch

def cal_saliency_score(pos, pos_grad, alpha=1):
    """
    pos: [B, N, 3]
    pos_grad: [B, N, 3]
    """
    x_c = torch.median(pos, dim=1, keepdim=True).values     # [B, 1, 3]
    r = torch.sqrt(torch.sum((pos - x_c) ** 2, dim=-1, keepdim=True))       # [B, N, 1]
    partial_L_partial_r = torch.sum(pos_grad * (pos - x_c) / r, dim=-1, keepdim=True)     # [B, N, 1]
    s = - partial_L_partial_r * (r ** (1+alpha))                # [B, N, 1]
    return s