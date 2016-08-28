#!/bin/bash

# Build latest version of Emacs, version management with stow
# OS: Ubuntu 14.04 LTS and newer
# version: 24.5
# Toolkit: lucid
#
# Source: https://github.com/favadi/build-emacs/blob/master/build-emacs.sh
#

set -eu

readonly version="24.5"

# install dependencies
apt-get -qq update
apt-get -qq install -y build-essential libx11-dev xaw3dg-dev \
     libjpeg-dev libpng12-dev libgif-dev libtiff5-dev libncurses5-dev \
     libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev \
     libxml2-dev libgpm-dev libotf-dev libm17n-dev \
     libgnutls-dev wget

# download source package
if [[ ! -d emacs-"$version" ]]; then
   wget http://ftp.gnu.org/gnu/emacs/emacs-"$version".tar.xz
   tar xvf emacs-"$version".tar.xz
fi

# build and install
cd emacs-"$version"
./configure \
    --with-xft \
    --with-x-toolkit=lucid

make
make \
    install-arch-dep \
    install-arch-indep \
    prefix=/usr/local/emacs-"$version"
