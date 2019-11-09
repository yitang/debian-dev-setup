#!/usr/bin/env bash

set -x -e
# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "-------------------------"
echo "install R core packages"
sudo apt-get install -y r-cran-car r-cran-rcpp r-cran-reshape2 r-cran-rcurl r-cran-ggplot2 r-cran-randomforest r-cran-glmnet r-cran-devtools
