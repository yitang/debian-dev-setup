#!/usr/bin/env bash

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "--------------------------"
echo "install R (newest version)"

# sudo apt-get install software-properties-common
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
# sudo add-apt-repository -y ppa:marutter/rdev
# sudo apt-get update
# sudo apt-get install -y r-base r-base-dev

# echo "-------------------------"
# echo "install R core packages"
# sudo apt-get install -y r-cran-car r-cran-rcpp r-cran-reshape2

echo "------------------------"
echo "install R packages from CRAN"

echo '#!/usr/bin/env Rscript
pkgs <- commandArgs(trailingOnly = TRUE)
tryInstallPackages <- function(pkg){
    msg <- function(pkg, ...) 
        cat(sprintf("\n%15s package", pkg), ...)
    pkg.installed <- rownames(installed.packages())
    if (pkg %in% pkg.installed) {
        msg(pkg, "is already installed, skip...")
        return()
    }
    tmp <- try(install.packages(pkg, dependencies = TRUE, repos = "http://cloud.r-project.org/"),
              silent = TRUE)
    if (class(tmp) == "try-error") {
        msg(pkg, "is missing from CRAN.")
    } else {
        msg(pkg, "is installed")
    }
}
invisible(sapply(pkgs, tryInstallPackages))' >> pipR.R
chmod +x pipR.R

sudo apt-get install r-cran-car  # dependence of caret, can't install in R from CRAN
sudo ./pipR.R ggplot2 lattice data.table reshape2 Rcpp
sudo ./pipR.R randomForest ranger e1071 glmnet caret
sudo ./pipR.R microbenchmark 
sudo rm pipR.R



# pkg <- commandArgs(trailingOnly = TRUE)
# ## print(args)
# # pkg <- readLines("/home/yitang/git/debian-dot/R_pkg.txt")
# f <- function(pkg.name) {
#     pkg.installed <- rownames(installed.packages())
# cat("\n")
#     if (pkg.name %in% pkg.installed) {
#         cat("\n", pkg.name, " is already installed, skip...")
#         return()
#     }
#     tmp <- try(install.packages(pkg.name, repos = "https://www.stats.bris.ac.uk/R/"), silent = TRUE)
#     if (class(tmp) == "try-error") {
#         cat("\n", pkg.name, " can not be installed")
#     } else {
#         cat("\n", pkg.name, " is installed")
#     }
# }
# invisible(sapply(pkg, f))'
