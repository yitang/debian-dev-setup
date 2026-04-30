#!/usr/bin/env bash

set -e
sudo -K

# Usage:
#   bash emacs.sh              # builds latest stable (default 30.1)
#   bash emacs.sh 29.4         # builds a specific version
#   bash emacs.sh 30.0.92      # builds a specific release candidate

# see https://gist.github.com/zoliky/0445b20676bfa85450d7df006066ceb7
# for MacOS, use https://github.com/d12frosted/homebrew-emacs-plus

EMACS_VERSION="${1:-30.1}"
DOWNLOAD_URL="https://ftp.gnu.org/gnu/emacs/emacs-${EMACS_VERSION}.tar.xz"
INSTALL_PREFIX="$HOME/bin/emacs${EMACS_VERSION}"

# Detect webkit2gtk version: 4.1-dev for Debian 13+, 4.0-dev for older
CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
WEBKIT_PKG="libwebkit2gtk-4.0-dev"
if [[ "$CODENAME" == "trixie" || "$CODENAME" == "forky" ]]; then
    WEBKIT_PKG="libwebkit2gtk-4.1-dev"
fi

sudo apt-get build-dep emacs -y
sudo apt-get install -y libtree-sitter-dev libmagick++-dev libmagickcore-dev "$WEBKIT_PKG"

# download Emacs directly instead of cloning the git repo - it's faster.
echo "Downloading Emacs ${EMACS_VERSION} from ${DOWNLOAD_URL}"
wget -O "emacs-${EMACS_VERSION}.tar.xz" "${DOWNLOAD_URL}"
tar xvf "emacs-${EMACS_VERSION}.tar.xz"

cd "emacs-${EMACS_VERSION}/"
./autogen.sh
./configure \
    --with-tree-sitter \
    --with-xwidgets \
    --with-mailutils \
    --with-native-compilation \
    --with-json \
    --with-jpeg \
    --with-png \
    --with-rsvg \
    --with-tiff \
    --with-wide-int \
    --with-xft \
    --with-xml2 \
    --prefix="${INSTALL_PREFIX}"

make -j"$(nproc)"
make install

echo "Emacs ${EMACS_VERSION} installed to ${INSTALL_PREFIX}"
echo "Run: ${INSTALL_PREFIX}/bin/emacs"

# make extraclean
# make bootstrap
