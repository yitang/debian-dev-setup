#!/usr/bin/env bash

# echo "---------------------"
# echo "Setting up emacs-snapshot repo"
# wget -q http://londo.ganneff.de/apt.key  -O- | apt-key add -
# echo "deb http://londo.ganneff.de jessie main" > /etc/apt/sources.list.d/emacs.list

# echo "--------------------"
# echo "Installing emacs-snapshot"
# sudo apt-get update
# sudo apt-get install emacs-snapshot emacs-snapshot-gtk 

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt-get install emacs25


echo "------------------"
echo "Installing required packages"
sudo apt-get install autoconf automake libtool texinfo build-essential xorg-dev libgtk2.0-dev libjpeg-dev libncurses5-dev libdbus-1-dev libgif-dev libtiff-dev libm17n-dev libpng12-dev librsvg2-dev libotf-dev libxml2-dev libcanberra-gtk-module libgnutls28-dev gnutls-bin curl


echo "------------------"
echo "Cloning emacs repo"
git clone --depth 1 https://github.com/emacs-mirror/emacs.git

echo "-----------------"
echo "Building emacs from the source"
cd emacs
./autogen.sh
./configure
make bootstrap
sudo make install



echo "need to install cask under user level"
## curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
