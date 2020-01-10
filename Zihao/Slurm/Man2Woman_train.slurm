#!/bin/bash

#SBATCH --account=h_oguz_lab_acc
#SBATCH --partition=pascal
#SBATCH --gres=gpu:2

# Max job duration
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=3G
#SBATCH --time=24:00:00
#SBATCH --output=gpu-job.log

# Job Name
#SBATCH --job-name=cyclegan

# Communication
#SBATCH --mail-user=shenxin.jiang@vanderbilt.edu
#SBATCH --mail-type=ALL

ml Anaconda3/5.0.1
source activate torch

python3 train.py --dataroot ./../../datasets/ManWoman_dataset --name ManWomanCycleGANunet  --model cycle_gan --netG unet_256 --netD n_layers --n_layers_D 5 --niter 300 --lr 0.001 --niter_decay 300
