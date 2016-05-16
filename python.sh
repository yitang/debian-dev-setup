#!/usr/bin/env bash

# # Removed user's cached credentials
# # This script might be run with .dots, which uses elevated privileges
sudo -K

echo "-------------------------"
echo "install (i)Python3"

sudo apt-get install python3 ipython3

echo "------------------------"
echo "Setting up pip3."

sudo apt-get install python3-pip

echo "-----------------------"
echo "Installing python packages for data analysis"

echo "Installing using Debian's repo"
sudo apt-get install \
     python3-numpy \
     python3-scipy \
     python3-pandas \
     python3-seaborn \
     python3-matplotlib \
     cython3
     #     python3-scikit-learn  # only aviable on sid. 

echo "Installing using pip"
sudo pip3 install scikit-learn feather-format ggplot

# echo "--------------------"
# echo "Installing xgbost"
# git clone --recursive https://github.com/dmlc/xgboost.git /tmp/xgboost
# cd /tmp/xgboost
# sudo ./build.sh
# cd python-package
# sudo python3 setup.py install
# rm -rf /tmp/xgboost


echo "--------------------"
echo "Installing hyperopt"
git clone https://github.com/yitang/hyperopt.git /tmp/hyperopt
cd /tmp/hyperopt/python3_version
sudo python3 setup.py install
sudo pip3 install networkx
rm -rf /tmp/hyperopt

