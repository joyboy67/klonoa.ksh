#!/bin/ksh

OPENTOONZ='balbla'
ALPINE=''

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
