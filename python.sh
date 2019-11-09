#!/usr/bin/env bash

set -x -e
# # Removed user's cached credentials
# # This script might be run with .dots, which uses elevated privileges
sudo -K

echo "-------------------------"
echo "install (i)Python3"

sudo apt-get -y install python3 ipython3 python3-dev

echo "------------------------"
echo "Setting up pip3."

sudo apt-get -y install python3-pip

echo "Install python tools"
sudo apt-get -y install csvkit snakemake

echo "-----------------------"
echo "Installing python packages for data analysis"

# echo "Installing using Debian's repo"
# sudo apt-get -y install \
#      python3-numpy \
#      python3-scipy \
#      python3-pandas \
#      python3-seaborn \
#      python3-matplotlib \
#      cython3 \
#      python3-sphinx \
#      python3-h5py \
#      python3-yaml
#      #     python3-scikit-learn  # only aviable on sid. 

# echo "Installing using pip"
# sudo pip3 install scikit-learn feather-format ggplot 

# echo "Installing tools for elpy"
# sudo pip3 install jedi flake8 importmagic yapf

# echo "Install packages for benchmark"
# sudo pip3 install pytest-benchmark pygal pygaljs

# echo "Install other packages"
# sudo pip3 install bokeh tqdm

# echo "Install python tools"
# sudo pip3 install snakemake csvkit

# echo "--------------------"
# echo "Installing xgbost"
# git clone --recursive https://github.com/dmlc/xgboost.git /tmp/xgboost
# cd /tmp/xgboost
# sudo ./build.sh
# cd python-package
# sudo python3 setup.py install
# rm -rf /tmp/xgboost


# echo "--------------------"
# echo "Installing hyperopt"
# git clone https://github.com/yitang/hyperopt.git /tmp/hyperopt
# cd /tmp/hyperopt/python3_version
# sudo pip3 install networkx==1.11
# udo python3 setup.py install 
# rm -rf /tmp/hyperopt

