FROM tensorflow/tensorflow:1.7.0-py3

LABEL maintainer="Monica Li <monica.li@uconn.edu>"

# Install python packages
RUN pip install --upgrade pip
RUN pip uninstall numpy --yes
RUN pip install -I numpy==1.16.2
RUN pip install -I librosa==0.6.3
RUN pip install -I matplotlib==3.0.3
RUN apt-get update -qq && \
      apt-get install -y python3-tk && \
      apt-get clean

# Configuration
# bash prompt
RUN cat /etc/bash.bashrc | sed -e "s/PS1=.*/PS1='\${debian_chroot:+(\$debian_chroot)}\\\u@\\\h \\\[\\\e[1;36m\\\](COMPSWR)\\\[\\\e[m\\\] \\\w\\\\$ '/" > /tmp/tmp.bashrc && \
mv /tmp/tmp.bashrc /etc/bash.bashrc

## singularity directories
RUN mkdir /share && \
      mkdir /scratch && \
      mkdir /local-scratch
## bind directories
RUN mkdir -p /bind/data_in && \
      mkdir -p /bind/data_out && \
      mkdir -p /bind/scripts

## PREpend user scripts to the path
ENV PATH /bind/scripts:$PATH

# setup singularity compatible entry points to run the initialization script
RUN /usr/bin/env \
      | sed  '/^HOME/d' \
      | sed '/^HOSTNAME/d' \
      | sed  '/^USER/d' \
      | sed '/^PWD/d' > /environment && \
chmod 755 /environment

COPY entry_init.sh /singularity
RUN chmod 755 /singularity

ENTRYPOINT ["/singularity"]
CMD ["/bin/bash"]

