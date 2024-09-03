#!/usr/bin/env bash
# see https://gist.github.com/zoliky/0445b20676bfa85450d7df006066ceb7
# for MacOS, use https://github.com/d12frosted/homebrew-emacs-plus
sudo apt-get build-dep emacs
sudo apt-get install libtree-sitter-dev
sudo apt-get install libmagick++-dev  libmagickcore-dev
sudo apt-get install libwebkit2gtk-4.1-dev

# get emacs source code
# git clone -b  emacs-29 --single-branch git://git.savannah.gnu.org/emacs.git emacs-29

# download Emacs direclty instead of clone git repo - its a lot faster.
wget http://mirrors.nav.ro/gnu/emacs/emacs-29.4.tar.xz
tar xvf emacs-29.4.tar.xz

cd emacs-29.1/
./autogen.sh
./configure --with-tree-sitter=ifavailable   --with-xwidgets  --with-mailutils --with-native-compilation --with-json --with-imagemagick --with-jpeg --with-png --with-rsvg --with-tiff --with-wide-int --with-xft --with-xml2

make -j2
make install



