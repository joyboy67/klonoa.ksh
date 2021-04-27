#!/bin/ksh

OPENTOONZ='balbla'
ALPINE=''
MINIX=''
LIENSUTILES=('https://framalibre.org/annuaires/cr%C3%A9ation', 'https://morevnaproject.org/')

echo ***Installation des paquets***

pkg_add ruby python node \ 
        wget git \
        zsh tcsh

cd /usr/bin
wget $OPENTOONZ
wget $ALPINE

gem install pry
gem install rails

npm -g install yarn

yarn global add nuxt
yarn global add vue


echo ***Terminé!***
