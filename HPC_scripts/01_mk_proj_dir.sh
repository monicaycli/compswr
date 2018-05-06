#!/bin/bash
# Make a directory skeleton for a project
PROJECT=$1
mkdir -p /scratch/${USER}/${PROJECT}/{data_in,data_out,scripts}
