#!/usr/bin/env bash

set -e
# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

sudo apt-get update

sudo apt-get install -y build-essential software-properties-common

sudo apt-get install -y git

sudo apt-get install -y libcurl4-openssl-dev libssl-dev

sudo apt-get install -y libssl-dev curl

sudo apt-get install -y ack-grep guake graphviz tree

# sudo apt-get install -y postgresql postgresql-client libpq-dev
