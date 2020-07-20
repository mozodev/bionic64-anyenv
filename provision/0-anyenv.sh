#!/bin/bash

echo 'housekeeping'
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y -qq update && sudo apt-get -y -qq upgrade && sudo apt-get -y -qq autoremove
sudo apt-get -y -qq install zip unzip
echo 'set timezone to Asia/Seoul'
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

echo "install anyenv"
git clone https://github.com/anyenv/anyenv ~/.anyenv
export PATH="$HOME/.anyenv/bin:$PATH" && echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.profile
if [ ! -d "$HOME/.config/anyenv/anyenv-install" ]; then yes | anyenv install --init -y; fi
eval "$(anyenv init -)" && echo 'eval "$(anyenv init -)"' >> ~/.profile  && . ~/.profile

echo "install hugo"
VERSION=0.74.1
curl -L "https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz" | tar -xz hugo
sudo mv hugo /usr/local/bin/
