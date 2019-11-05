#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD wrwp from source
export CONDA_PREFIX=/srv/conda/envs/notebook

# Install system dependencies, not conda in this case
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib

cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp

# install DRQC from source
cd ~
cd tmp
git clone --depth 1 https://github.com/DanielMichelson/drqc_py3.git
cd drqc_py3/

source $CONDA_DIR/bin/activate $RADARENV
# Why must the following line be explicit? Second time just to be safe...
export CONDA_PREFIX=/srv/conda/envs/notebook

make
make test
make install
cd
