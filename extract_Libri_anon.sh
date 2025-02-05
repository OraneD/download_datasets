#!/bin/bash
#SBATCH --job-name=ExtractAnon
#SBATCH --output=ExtractAnon%j.out
#SBATCH --error=ExtractAnon%j.err
#SBATCH --ntasks=30
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=10
#SBATCH --time=15:00:00
#SBATCH --account=yjs@v100

source ~/.bashrc
conda activate kiwano_env
set -x
srun python extract_tar.py $SCRATCH/LibriHeavy/heavy_trials_anon_B5.tar.gz $SCRATCH/LibriHeavy/