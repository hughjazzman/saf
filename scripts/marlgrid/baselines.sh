#!/bin/bash

#SBATCH --job-name=marlgrid_coordination
#SBATCH --partition=long                        
#SBATCH --cpus-per-task=2
#SBATCH --gres=gpu:rtx8000:1
#SBATCH --mem=70G                                     
#SBATCH --time=6:00:00
#SBATCH --array=1-10


#param_store=scripts/seeds.txt
#seed=$(cat $param_store | awk -v var=$SLURM_ARRAY_TASK_ID 'NR==var {print $1}')
env=$1
N_agents=$2
Method=$3
coordination=$4
heterogeneity=$5
seed=$6
ProjectName=$7
# 1. Load the required modules
module --quiet load anaconda/3
#conda activate marl
conda activate PettingZoo

ExpName=${env}"_"${N_agents}"_"${coordination}"_"${heterogeneity}"_"${Method}"_"${seed}
echo "doing experiment: ${ExpName}"

HYDRA_FULL_ERROR=1 python run.py \
env=marlgrid  \
env.name=${env} \
env.params.max_steps=200 \
env.params.coordination=${coordination} \
env.params.heterogeneity=${heterogeneity} \
seed=${seed} \
n_agents=${N_agents} \
env_steps=100 \
env.params.num_goals=100 \
policy=${Method} \
policy.params.type=conv \
runner.params.comet.project_name=$ProjectName \
runner.params.comet.experiment_name=${ExpName}
