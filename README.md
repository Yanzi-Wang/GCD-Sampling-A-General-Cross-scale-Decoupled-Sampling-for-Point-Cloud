# GCD-Sampling-A-General-Cross-scale-Decoupled-Sampling-for-Point-Cloud
This repository provides the official implementation of GCD-Sampling: A General Cross-scale Decoupled Sampling for Point Cloud at AAAI 2025.

Our code is coming soon ……

## Introduction
Sampling strategy (e.g., fixed farthest point sampling) of point cloud has been an essential step for developing practical solutions in 3D computer vision tasks. Previous fixed sampling is simple, but suffer from suboptimal performance for downstream tasks. To adapt to target networks properly, adaptive sampling methods with trainable parameters have been recently developed to enhance the performance. However, existing adaptive sampling methods still suffer from the over-coupling problem of target network, and thus become model-specific, which limits their practical applications. To address this issue, we propose a novel general cross-scale decoupled sampling method (GCD-sampling) for point cloud, which consists of original feature cache, cross-scale feature fusion and convex combination learning for better feature extraction. To reduce the coupling relationship with the target task network, our method only utilizes the point cloud coordinates as the input and output of itself. Besides, we introduce an arbitrary scale structure to enable parameter sharing across multi-scale sampling in point cloud networks. Extensive experiments on different architectures demonstrate the effectiveness of our method over other existing adaptive sampling methods.

<div align="center">
    <img width="527" alt="image" src="https://github.com/user-attachments/assets/604fb029-a016-4fa0-98b6-2b67ffd335b0" />
</div>

## Requirements
Our code is coming soon ……
