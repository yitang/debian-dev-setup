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
# Install Python data modules
sudo pip3 install numpy
sudo pip3 install scipy
sudo pip3 install matplotlib
sudo pip3 install pandas
sudo pip3 install unittest2
sudo pip3 install seaborn
sudo pip3 install scikit-learn
sudo pip3 install "ipython[all]"
