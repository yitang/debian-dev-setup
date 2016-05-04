#!/usr/bin/env bash

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

sud apt-get update

sudo apt-get install build-essential software-properties-common

sudo apt-get install git

sudo apt-get install libcurl4-openssl-dev libssl-dev

sudo apt-get install libnlopt libssl-dev

sudo apt-get install postgresql postgresql-client libpq-dev

sudo apt-get install maildir-utils isync offlineimap
