#!/bin/bash



#different baselines at different levels of coordination for marlgrid

# ProjectName="differnet_coordination_levels_baselines"
# #ProjectName="test"


# declare -a All_Envs=("ClutteredGoalTileCoordinationEnv")


# declare -a All_N_agents=(10)

# declare -a All_Methods=("ippo" "mappo")

# declare -a All_coordination=(1 2 3 4 5)

# declare -a All_heterogeneity=(1)


# Seeds=($(seq 1 1 3))



# for Env in "${All_Envs[@]}"
# do

# 	for N_agents in "${All_N_agents[@]}"
# 	do
# 		for Method in "${All_Methods[@]}"
# 		do
# 			for coordination in "${All_coordination[@]}"
# 			do
# 				for heterogeneity in "${All_heterogeneity[@]}"
# 				do					

# 					for Seed in "${Seeds[@]}"
# 					do


# 						sbatch scripts/marlgrid/baselines.sh $Env $N_agents $Method $coordination $heterogeneity $Seed $ProjectName

# 					done
# 				done			
# 			done
# 		done
# 	done
# done






#different baselines at different levels of heterogeneity for marlgrid

ProjectName="differnet_heterogeneity_levels_baselines"
#ProjectName="test"


declare -a All_Envs=("ClutteredGoalTileCoordinationHeterogeneityEnv")


declare -a All_N_agents=(10)

declare -a All_Methods=("ippo" "mappo")

declare -a All_coordination=(1)

declare -a All_heterogeneity=(1 2 3 4 5)


Seeds=($(seq 1 1 3))



for Env in "${All_Envs[@]}"
do

	for N_agents in "${All_N_agents[@]}"
	do
		for Method in "${All_Methods[@]}"
		do
			for coordination in "${All_coordination[@]}"
			do
				for heterogeneity in "${All_heterogeneity[@]}"
				do					

					for Seed in "${Seeds[@]}"
					do


						sbatch scripts/marlgrid/baselines.sh $Env $N_agents $Method $coordination $heterogeneity $Seed $ProjectName

					done
				done			
			done
		done
	done
done



