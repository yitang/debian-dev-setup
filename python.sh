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
     python3-matplotlib 
     #     python3-scikit-learn  # only aviable on sid. 

echo "Installing using pip"
sudo pip3 install scikit-learn
