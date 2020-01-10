#!/bin/bash

#SBATCH --account=h_oguz_lab_acc
#SBATCH --partition=pascal
#SBATCH --gres=gpu:2

# Max job duration
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=3G
#SBATCH --time=2:00:00
#SBATCH --output=gpu-job.log

# Job Name
#SBATCH --job-name=cyclegan

# Communication
#SBATCH --mail-user=shenxin.jiang@vanderbilt.edu
#SBATCH --mail-type=ALL

ml Anaconda3/5.0.1
source activate torch

python3 ../../CYCLEGAN/pytorch-CycleGAN-and-pix2pix/test.py --dataroot ../../datasets/ManWoman_dataset --name ManWomanCycleGANunet --model cycle_gan --checkpoints_dir /scratch/jians10/model --results_dir /scratch/jians10/testresult/result

