#!/bin/ksh

cd ~
mkdir images
mkdir bin

ALPINE='https://nl.alpinelinux.org/alpine/v3.15/releases/x86_64/alpine-virt-3.15.0-x86_64.iso'
KOLIBRIOS=''
MINIX='git://github.com/Stichting-MINIX-Research-Foundation/minix.git'
FREEDOS='git://github.com/FDOS/kernel.git'
FREERTOS = 'git://github.com/FreeRTOS/FreeRTOS.git'
PLAN9=''
9LIB='git://github.com/9fans/plan9port.git'
JPEGTURBO=''
SuperLU=''
ORCA='git://github.com/hundredrabbits/Orca-c.git'
OPENTOONZ='git://github.com/morevnaproject-org/opentoonz.git'
LIONSBOOK='http://www.lemis.com/grog/Documentation/Lions/book.pdf'
LIENSUTILES=('https://framalibre.org/annuaires/cr%C3%A9ation', 'https://www.openbsd.org/', 'https://wiki.openbsd.fr.eu.org/doku.php/tips/kit-survie',
             'https://www.3hg.fr/', 'https://morevnaproject.org/', 'http://www.minix3.org/', 'https://openports.se/plan9', 'https://9fans.github.io/plan9port/', 
             'http://9front.org/', 'https://pspodcasting.net/dan/blog/2019/plan9_desktop.html')


echo *** Installation des paquets ***

pkg_add -vmzl ./klonoa/paquets.txt
git clone $OPENTOONZ ./bin/OpenToonz
git clone $ORCA ./bin/Orca-c
cd bin/Orca-c && make && mv build/orca ~/bin/orca && cd ~ 

echo *** Installation des gems ruby ***

gem install pry nokogiri metasploit-framework metasploit-payloads

echo *** Instalation des paquets nodejs ***

npm -g install npm yarn
yarn global add vue nuxt netlistsvg #https://github.com/nturley/netlistsvg

echo *** misc. ***

ftp $LIONSBOOK
git clone $MINIX ./images/minix
git clone $FREEDOS ./images/freedos
ftp $ALPINE -o ./images/alpine-virt-3.15.0-x86_64.iso

touch liens_utiles.txt
for i in $LIENSUTILES
do
        echo i >> liens_utiles.txt
done

echo *** Klonoa terminé! ***
