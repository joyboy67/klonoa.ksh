#!/bin/ksh

OPENTOONZ='https://github.com/morevnaproject-org/opentoonz'
ALPINE=''
MINIX='https://github.com/Stichting-MINIX-Research-Foundation/minix'
PLAN9=''
9LIB='https://github.com/9fans/plan9port'
FREEDOS='https://github.com/FDOS/kernel'
LIENSUTILES=('https://framalibre.org/annuaires/cr%C3%A9ation', 'https://www.openbsd.org/', 'https://morevnaproject.org/', 'https://9fans.github.io/plan9port/')
JPEGTURBO=''
SuperLU=''
LIONSBOOK='http://www.lemis.com/grog/Documentation/Lions/book.pdf'

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

cd /lib/images
git clone $MINIX 

cd ../dos
git clone $FREEDOS

gem install pry
gem install rails

npm -g install yarn

yarn global add nuxt
yarn global add vue

for i in $LIENSUTILES
do
        echo i >> /usr/desktop/liens_utiles.txt
done

wget $LIONSBOOK /usr/desktop

echo ***Terminé!***
