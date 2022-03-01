#!/bin/ksh

cd ~
mkdir images
mkdir bin

ALPINE=''
KOLIBRIOS=''
MINIX='git://github.com/Stichting-MINIX-Research-Foundation/minix.git'
FREEDOS='git://github.com/FDOS/kernel.git'
FREERTOS = 'git://github.com/FreeRTOS/FreeRTOS.git'
PLAN9=''
9LIB='https://github.com/9fans/plan9port'
JPEGTURBO=''
SuperLU=''
OPENTOONZ='git://github.com/morevnaproject-org/opentoonz.git'
LIONSBOOK='http://www.lemis.com/grog/Documentation/Lions/book.pdf'
LIENSUTILES=('https://framalibre.org/annuaires/cr%C3%A9ation', 'https://www.openbsd.org/', 'https://wiki.openbsd.fr.eu.org/doku.php/tips/kit-survie',
             'https://www.3hg.fr/', 'https://morevnaproject.org/', 'http://www.minix3.org/', 'https://openports.se/plan9', 'https://9fans.github.io/plan9port/', 
             'http://9front.org/', 'https://pspodcasting.net/dan/blog/2019/plan9_desktop.html')


echo *** Installation des paquets ***

pkg_add -vmzl paquets.txt
git clone $OPENTOONZ ./bin

echo *** Installation des gems ruby ***

gem install pry
gem install nokogiri

echo *** Instalation des paquets nodejs ***

npm -g install npm
npm -g install yarn
yarn global add vue
yarn global add nuxt
yarn global add netlistsvg #https://github.com/nturley/netlistsvg

echo *** misc. ***

git clone $MINIX ./images
git clone $FREEDOS ./images

touch liens_utiles.txt
for i in $LIENSUTILES
do
        echo i >> liens_utiles.txt
done

ftp $LIONSBOOK

echo *** Installation de Klonoa terminé! ***
