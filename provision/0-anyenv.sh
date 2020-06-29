#!/bin/bash

echo 'housekeeping'
sudo apt-get -y -qq update && sudo apt-get -y -qq upgrade && sudo apt-get -y -qq autoremove
sudo apt-get -y -qq install zip unzip
echo 'set timezone to Asia/Seoul'
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

echo "install anyenv"
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'if [ ! -d /home/vagrant/.config/anyenv/ ] anyenv install --init -y' >> ~/.bashrc
echo 'eval "$(anyenv init -)"' >> ~/.bashrc  && . ~/.bashrc

echo "install hugo"
curl -L https://github.com/gohugoio/hugo/releases/download/v0.72.0/hugo_0.72.0_Linux-64bit.tar.gz | tar -xz hugo
sudo mv hugo /usr/local/bin/
