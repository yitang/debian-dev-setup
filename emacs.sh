#!/usr/bin/env bash

# using ubuntu's ppa
# sudo add-apt-repository -y ppa:ubuntu-elisp
# sudo sed -i 's/jessie/trusty/g' /etc/apt/sources.list.d/ubuntu-elisp-ppa-jessie.list

echo "---------------------"
echo "Setting up emacs-snapshot repo"
wget -q http://londo.ganneff.de/apt.key  -O- | apt-key add -
echo "deb http://londo.ganneff.de jessie main" > /etc/apt/sources.list.d/emacs.list

echo "--------------------"
echo "Installing emacs-snapshot"
sudo apt-get update
sudo apt-get install emacs-snapshot emacs-snapshot-gtk 

# sudo apt-get install org-mode


# deb http://emacs.naquadah.org/ stable/
# deb-src http://emacs.naquadah.org/ stable/

# "deb http://www.stats.bris.ac.uk/R/bin/linux/debian jessie-cran3/" > /etc/apt/sources.list.d/R.list
