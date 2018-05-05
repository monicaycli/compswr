#!/bin/bash
#SBATCH --mail-type=ALL                 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=monica.li@uconn.edu # Your email address
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks=1                      # Number of CPU cores per node
#SBATCH --time=04:00:00                 # Time limit hh:mm:ss
#SBATCH -e error_%A_%a.log              # Standard error
#SBATCH -o output_%A_%a.log             # Standard output
#SBATCH --job-name=TestTensorflow       # Descriptive job name
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1                    # Request a GPU; max is 2

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK    #<= cpus-per-task
##### END OF JOB DEFINITION  #####

#Define user paths
NETID=$USER
PROJECT=COMPSWR

export DIR_BASE=/scratch/${NETID}/${PROJECT}
export DIR_DATA=${DIR_BASE}/data             #rw
export DIR_SCRIPTS=${DIR_BASE}/scripts       #ro, prepended to PATH
export DIR_WORK=/work                        #rw /work on HPC is 40Gb local storage

# Load modules
module load singularity/2.3.1-gcc  #required to run the container
modual load cuda/9.1

# finally call the container with any arguments for the job
# wrapper will bind the appropriate paths
# environment variables are passed to the container

./run_container.sh <parameters>
