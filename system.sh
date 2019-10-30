#!/usr/bin/env bash

set -e
# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

sudo apt-get update

sudo apt-get install build-essential software-properties-common

sudo apt-get install git

sudo apt-get install libcurl4-openssl-dev libssl-dev

sudo apt-get install libssl-dev curl


# sudo apt-get install postgresql postgresql-client libpq-dev

sudo apt-get install graphviz ack-grep 

# sudo apt-get install maildir-utils isync offlineimap gnutls-bin

# sudo apt-get install libhdf5-dev libopenmpi-dev mpich libmpich-dev 

sudo apt-get install tree

