#!/bin/ksh

OPENTOONZ='https://github.com/morevnaproject-org/opentoonz'
ALPINE=''
MINIX=''
PLAN9=''
9LIB='https://github.com/9fans/plan9port'
FREEDOS='https://github.com/FDOS/kernel'
LIENSUTILES=('https://framalibre.org/annuaires/cr%C3%A9ation', 'https://morevnaproject.org/', 'https://9fans.github.io/plan9port/')
JPEGTURBO=''
SuperLU=''

echo ***Installation des paquets***

pkg_add ruby python node \ 
        wget git \
        zsh tcsh \
        cmake pkgconf boost qt5 lz4 usb lzo2 png jpeg glew freeglut freetype json-c mypaint opencv gsl blas

cd /usr/bin
git clone $OPENTOONZ
wget $ALPINE

cd /lib
git clone $9LIB && ./INSTALL

cd /lib/images/dos
git clone $FREEDOS

gem install pry
gem install rails

npm -g install yarn

yarn global add nuxt
yarn global add vue


echo ***Terminé!***
