#!/bin/bash
#SBATCH --mail-type=ALL                    # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=first.last@uconn.edu   # Your email address
#SBATCH --nodes=1                          # Number of nodes
#SBATCH --ntasks=1                         # Number of CPU cores per node
#SBATCH --time=04:00:00                    # Time limit hh:mm:ss
#SBATCH -e error_%A_%a.log                 # Standard error
#SBATCH -o output_%A_%a.log                # Standard output
#SBATCH --job-name=MyJob                   # Descriptive job name

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK    #<= cpus-per-task
##### END OF JOB DEFINITION  #####

#Define user paths
NETID=$USER
PROJECT=MyProject

export DIR_BASE=/scratch/${NETID}/${PROJECT}
export DIR_DATAIN=${DIR_BASE}/data_in
export DIR_DATAOUT=${DIR_BASE}/data_out
export DIR_SCRIPTS=${DIR_BASE}/scripts       #prepended to PATH

# Load modules
module load singularity/2.6  #required to run the container

# finally call the container with any arguments for the job
# the arguments have to be accessible from inside the container
# run_container.sh will bind the appropriate paths
# environment variables are passed to the container

./run_container.sh "$@"
