#!/bin/bash
#SBATCH --job-name=ExtractTar
#SBATCH --output=ExtractTar%j.out
#SBATCH --error=ExtractTar%j.err
#SBATCH --ntasks=30
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=10
#SBATCH --time=05:00:00
#SBATCH --account=yjs@v100

bash
module purge
conda deactivate
module load pytorch-gpu/py3/2.3.0
set -x
srun python extract_tar.py $SCRATCH/LibriHeavy/heavy_trials_.tar.gz $SCRATCH/LibriHeavy/