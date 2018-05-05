#!/bin/bash
# Run the container
# Delete any unused bind points below
# If you have permissions, you can add :ro to the end of bind options
# to restrict writing in the container

IMG_PATH=/scratch/yil14028/containers/compswr.img

singularity run \
--bind ${DIR_DATA}:/bind/data \
--bind ${DIR_SCRIPTS}:/bind/scripts \
--bind ${DIR_WORK}:/bind/work \
$IMG_PATH "$@"
