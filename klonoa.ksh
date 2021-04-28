#!/bin/ksh

OPENTOONZ='https://github.com/morevnaproject-org/opentoonz'
ALPINE=''
MINIX='https://github.com/Stichting-MINIX-Research-Foundation/minix'
PLAN9=''
9LIB='https://github.com/9fans/plan9port'
FREEDOS='https://github.com/FDOS/kernel'
JPEGTURBO=''
SuperLU=''
LIONSBOOK='http://www.lemis.com/grog/Documentation/Lions/book.pdf'
LIENSUTILES=('https://framalibre.org/annuaires/cr%C3%A9ation', 'https://www.openbsd.org/', 'https://wiki.openbsd.fr.eu.org/doku.php/tips/kit-survie',
             'https://www.3hg.fr/', 'https://morevnaproject.org/', 'http://www.minix3.org/', 'https://openports.se/plan9', 'https://9fans.github.io/plan9port/', 
             'http://9front.org/')

echo ***Installation des paquets***

pkg_add ruby python node \ 
        9libs plan9port 9menu wily sam
        zsh tcsh \
        git cmake pkgconf boost qt5 lz4 usb lzo2 png jpeg glew freeglut freetype json-c mypaint opencv gsl blas \
        blender

cd /usr/bin
git clone $OPENTOONZ
ftp -o $ALPINE alpine

cd /lib/images
git clone $MINIX minix

cd ../dos
git clone $FREEDOS freedos

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
