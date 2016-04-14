#!/usr/bin/env bash

# using ubuntu's ppa
# sudo add-apt-repository -y ppa:ubuntu-elisp
# sudo sed -i 's/jessie/trusty/g' /etc/apt/sources.list.d/ubuntu-elisp-ppa-jessie.list

# echo "---------------------"
# echo "Setting up emacs-snapshot repo"
# wget -q http://londo.ganneff.de/apt.key  -O- | apt-key add -
# echo "deb http://londo.ganneff.de jessie main" > /etc/apt/sources.list.d/emacs.list

# echo "--------------------"
# echo "Installing emacs-snapshot"
# sudo apt-get update
# sudo apt-get install emacs-snapshot emacs-snapshot-gtk 

echo "------------------"
echo "Installing required packages"
sudo apt-get install autoconf automake libtool texinfo build-essential xorg-dev libgtk2.0-dev libjpeg-dev libncurses5-dev libdbus-1-dev libgif-dev libtiff-dev libm17n-dev libpng12-dev librsvg2-dev libotf-dev libxml2-dev libcanberra-gtk-module

echo "------------------"
echo "Clone emacs repo"
git clone --depth 1 git://git.sv.gnu.org/emacs.git

echo "-----------------"
echo "Building emacs from the source"
cd emacs
./autogen.sh
./configure
make bootstrap
sudo make install
