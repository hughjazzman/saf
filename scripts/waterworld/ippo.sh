#!/bin/bash

#SBATCH --job-name=ippo_waterworld
#SBATCH --partition=long                        
#SBATCH --cpus-per-task=6
#SBATCH --gres=gpu:rtx8000:1
#SBATCH --mem=60G                                     
#SBATCH --time=16:00:00
#SBATCH -o /network/scratch/o/oussama.boussif/slurms/ippo_waterworld-slurm-%j.out  

# 1. Load the required modules
module --quiet load anaconda/3
conda activate marl

python run.py \
policy=ippo \
env=waterworld \
runner.params.lr_decay=False \
runner.params.env_steps=500 \
runner.params.comet.project_name=waterworld \
runner.params.total_timesteps=10000000 \
runner.params.n_agents=5 \
buffer.n_agents=5 \
buffer.env_steps=500 \
buffer.continuous_action=True \
policy.params.continuous_action=True \
policy.params.n_agents=5