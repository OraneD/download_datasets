#!/bin/bash
#SBATCH --job-name=PrepareVox1
#SBATCH --output=PrepareVox1%j.out
#SBATCH --error=PrepareVox1%j.err
#SBATCH --ntasks=30
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=10
#SBATCH --time=05:00:00
#SBATCH --account=yjs@v100

source ~/.bashrc
conda activate kiwano_env
set -x
python ../kiwano/recipes/resnet/local/prepare_voxceleb1.py --vad --num_jobs 30 $SCRATCH/voxceleb1/ $SCRATCH/resnet_data/voxceleb1/
