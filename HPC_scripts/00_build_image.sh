#!/bin/bash
#SBATCH --mail-type=ALL                  # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=first.last@uconn.edu # Your email address
#SBATCH --nodes=1                        # Number of nodes
#SBATCH --ntasks=1                       # Number of CPU cores per node
#SBATCH --mem=1024mb                     # Memory limit
#SBATCH --time=01:00:00                  # Time limit hh:mm:ss
#SBATCH -e error_%A_%a.log               # Standard error
#SBATCH -o output_%A_%a.log              # Standard output
#SBATCH --job-name=BuildImage            # Descriptive job name

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK      #<= cpus-per-task
##### END OF JOB DEFINITION  #####

# Load modules
module load singularity/2.6

# build singularity image from docker image online
if [ ! -d /scratch/$USER/containers/ ]; then
  mkdir -p /scratch/$USER/containers
fi
cd /scratch/$USER/containers

singularity build compswr_tf170cpu.img docker://monicaycli/compswr:tf170cpu
