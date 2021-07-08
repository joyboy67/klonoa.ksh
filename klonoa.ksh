#!/bin/ksh

user=$(whoiam)
ftp https://framagit.org/3hg/isotop/ isotop/

ALPINE=''
KOLIBRIOS=''
MINIX='https://github.com/Stichting-MINIX-Research-Foundation/minix'
FREEDOS='https://github.com/FDOS/kernel'

PLAN9=''
9LIB='https://github.com/9fans/plan9port'

JPEGTURBO=''
SuperLU=''

OPENTOONZ='https://github.com/morevnaproject-org/opentoonz'

LIONSBOOK='http://www.lemis.com/grog/Documentation/Lions/book.pdf'
LIENSUTILES=('https://framalibre.org/annuaires/cr%C3%A9ation', 'https://www.openbsd.org/', 'https://wiki.openbsd.fr.eu.org/doku.php/tips/kit-survie',
             'https://www.3hg.fr/', 'https://morevnaproject.org/', 'http://www.minix3.org/', 'https://openports.se/plan9', 'https://9fans.github.io/plan9port/', 
             'http://9front.org/', 'https://pspodcasting.net/dan/blog/2019/plan9_desktop.html')

echo ***Installation des paquets***

pkg_add -vmzl paquets.txt

gem install pry
gem install nokogiri

npm -g install yarn
yarn global add nuxt
yarn global add vue
yarn global add netlistsvg #https://github.com/nturley/netlistsvg

cd /usr/bin
git clone $OPENTOONZ
ftp -o $ALPINE alpine

cd /lib/images
git clone $MINIX minix
git clone $FREEDOS freedos

cd ~

for i in $LIENSUTILES
do
        echo i >> /usr/desktop/liens_utiles.txt
done

wget $LIONSBOOK /usr/desktop

sh isotop/isotop-user.sh
su root isotop/isotop-root.sh

echo ***Terminé!***
