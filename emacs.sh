#!/usr/bin/env bash

sudo apt-get build-dep emacs





echo "------------------"
echo "Installing required packages"
sudo apt-get install autoconf automake libtool texinfo build-essential xorg-dev libgtk2.0-dev libjpeg-dev libncurses5-dev libdbus-1-dev libgif-dev libtiff-dev libm17n-dev libpng-dev librsvg2-dev libotf-dev libxml2-dev libcanberra-gtk-module libgnutls28-dev gnutls-bin curl


echo "Clone Emacs Repo"
git clone --depth 1 git://git.savannah.gnu.org/emacs.git
git checkout emacs-28

./autogen.sh
./configure --with-cairo --with-modules --without-compress-install --with-x-toolkit=no --with-gnutls --without-gconf --without-xwidgets --without-toolkit-scroll-bars --without-xaw3d --without-gsettings --with-mailutils --with-native-compilation --with-json --with-harfbuzz --with-imagemagick --with-jpeg --with-png --with-rsvg --with-tiff --with-wide-int --with-xft --with-xml2 --with-xpm CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer" prefix=/usr/local
make -j2
make install



# echo "------------------"
# echo "Cloning emacs repo"
# git clone --depth 1 https://github.com/emacs-mirror/emacs.git

# echo "-----------------"
# echo "Building emacs from the source"
# cd emacs
# ./autogen.sh
# ./configure
# make bootstrap
# sudo make install



echo "need to install cask under user level"
## curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
# export PATH="$HOME/.cask/bin:$PATH"

# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

apt install libwebkit2gtk-4.0-dev libxpm-dev libgif-dev libtiff-dev libgnutls28-dev

make
make check
sudo make install







sudo apt-get install libgccjit-10-dev libgccjit0 libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-dev

git clone -b  emacs-29 --single-branch git://git.savannah.gnu.org/emacs.git emacs-29
./autogen.sh
./configure --with-tree-sitter=ifavailable   --with-xwidgets  --with-mailutils --with-native-compilation --with-json --with-imagemagick --with-jpeg --with-png --with-rsvg --with-tiff --with-wide-int --with-xft --with-xml2

make -j2
make install



