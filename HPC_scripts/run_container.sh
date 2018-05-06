#!/bin/bash
# Run the container
# Delete any unused bind points below
# If you have permissions, you can add :ro to the end of bind options
# to restrict writing in the container

# You are welcome to use my compiled image on the HPC
IMG_PATH=/scratch/yil14028/containers/compswr_tf170gpu.img

# If you compiled your own image using 00_build_imag.sh
# use the following instead
#IMG_PATH=/scratch/$USER/containers/compswr_tf170gpu.img

singularity run \
--bind ${DIR_DATAIN}:/bind/data_in \
--bind ${DIR_DATAOUT}:/bind/data_out \
--bind ${DIR_SCRIPTS}:/bind/scripts \
--nv $IMG_PATH "$@"
