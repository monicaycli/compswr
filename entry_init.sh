#!/bin/bash
# entrypoint pre-initialization
source /environment
cat /bashrc >> ~/.bashrc

# run the user command
exec "$@"
