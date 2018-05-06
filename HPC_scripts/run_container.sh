#!/bin/bash
# Run the container
# Delete any unused bind points below
# If you have permissions, you can add :ro to the end of bind options
# to restrict writing in the container

# You may use the compiled version
IMG_PATH=/scratch/yil14028/containers/compswr.img

# If you compiled your own image using 00_build_imag.sh
# use the following instead
#IMG_PATH=/scratch/$USER/containers/compswr.img

singularity run \
--bind ${DIR_DATAIN}:/bind/data_in \
--bind ${DIR_DATAOUT}:/bind/data_out \
--bind ${DIR_SCRIPTS}:/bind/scripts \
--bind ${DIR_WORK}:/bind/work \
$IMG_PATH "$@"
