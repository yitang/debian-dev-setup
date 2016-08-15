#!/usr/bin/env bash

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

# echo "--------------------------"
# echo "install R"

# sudo echo "deb http://http://cloud.r-project.org/bin/linux/debian jessie-cran3/" >> /etc/apt/sources.list.d/R.list
# sudo apt-key adv --keyserver keys.gnupg.net --recv-key 381BA480
# sudo apt-get update
# sudo apt-get install r-base r-base-core
# sudo apt-get build-dep r-base # install X11, latex and other stuff


# dependence of caret, can't install in R from CRAN
echo "-------------------------"
echo "install R core packages"
sudo apt-get install -y r-cran-car r-cran-rcpp r-cran-reshape2
sudo apt-get install -y r-cran-car r-cran-rcurl r-cran-Rcpp r-cran-reshape2 r-cran-ggplot2 r-cran-randomforest

echo "------------------------"
echo "install R packages from CRAN"

echo '#!/usr/bin/env Rscript
pkgs <- commandArgs(trailingOnly = TRUE)

if (pkgs[1] == "--github") {
    library(devtools, quiet=T)
    install.from.github <- TRUE
    pkgs <- pkgs[-1]
} else {
    install.from.github <- FALSE
}

msg <- function(pkg, ...) cat(sprintf("\n%15s package", pkg), ...)

pkgs.installed <- rownames(installed.packages())

for (pkg in pkgs) {
    
    if (install.from.github) { ## install from github
        pkg.name <- strsplit(pkg, "/")[[1]][2] # REPO/PKG format
        if (pkg.name %in% pkgs.installed) {
            msg(pkg, "is already installed, skip...\n")
            next
        }
        install <- try(install_github(pkg), silent=T)
        if (class(install) == "try-error") {
            msg(pkg, "is missing from ", pkg, "on Github\n")
        } else {
            msg(pkg, "is installed")
        }

        
    } else {  ## install from CRAN
        if (pkg %in% pkgs.installed) {
            msg(pkg, "is already installed, skip...\n")
            next
        }
        install <- try(install.packages(pkg, dependencies = TRUE, repos = "http://cloud.r-project.org/"),
                      silent = TRUE)
        if (class(install) == "try-error") {
            msg(pkg, "is missing from ", pkg, "on Github\n")
        } else {
            msg(pkg, "is installed")
        }

    }
}
' >> pipR.R
chmod +x pipR.R

# core packages
sudo ./pipR.R lattice data.table readr 
# pakcages for ml
sudo ./pipR.R randomForest ranger e1071 glmnet caret Rtsne lme4 earth Metrics cluey pROC corrplot
# utils
sudo ./pipR.R microbenchmark lubridate argparser ascii
# package development
sudo ./pipR.R roxygen2 devtools testthat logging
# database
sudo ./pipR.R --github rstats-db/DBI rstats-db/RPostgres hadley/tibble  wesm/feather/R

sudo rm pipR.R
