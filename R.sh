#!/usr/bin/env bash

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "--------------------------"
echo "install R"

# sudo echo "deb http://ftp.uk.debian.org/debian sid main" >> /etc/apt/sources.list
# sudo apt-get update
sudo apt-get install r-base r-base-core

echo "-------------------------"
echo "install R core packages"
sudo apt-get install -y r-cran-car r-cran-rcpp r-cran-reshape2

echo "------------------------"
echo "install R packages from CRAN"

echo '#!/usr/bin/env Rscript
library(devtools, quiet=T)
pkgs <- commandArgs(trailingOnly = TRUE)
if (pkgs[1] == "--github") {
    install.from.github <- TRUE
    pkgs <- pkgs[-1]
} else {
    install.from.github <- FALSE
}
tryInstallPackages <- function(pkg){
    msg <- function(pkg, ...) 
        cat(sprintf("\n%15s package", pkg), ...)
    pkg.installed <- rownames(installed.packages())
    if (pkg %in% pkg.installed) {
        msg(pkg, "is already installed, skip...")
        return()
    }
    if (install.from.github) {
        install <- try(install_github(pkg), silent=T)
    } else {
        install <- try(install.packages(pkg, dependencies = TRUE, repos = "http://cloud.r-project.org/"),
            silent = TRUE)
    }
    if (class(install) == "try-error") {
        msg(pkg, "is missing from ", ifelse(install.from.github,
                                            paste("Github repo", pkg),
                                            "CRAN."))
    } else {
        msg(pkg, "is installed")
    }
}
invisible(sapply(pkgs, tryInstallPackages))' >> pipR.R
chmod +x pipR.R

# dependence of caret, can't install in R from CRAN
sudo apt-get install r-cran-car r-cran-rcurl  
# core packages
sudo ./pipR.R ggplot2 lattice data.table readr reshape2 Rcpp 
# pakcages for ml
sudo ./pipR.R randomForest ranger e1071 glmnet caret Rtsne lme4 earth 
# utils
sudo ./pipR.R microbenchmark lubridate argparser ascii
# package development
sudo ./pipR.R roxygen2 devtools
sudo rm pipR.R
