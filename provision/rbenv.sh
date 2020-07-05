#!/bin/bash

echo "[rbenv] install rbenv dependencies"
sudo apt-get -y -qq install autoconf build-essential bison libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libgdbm5 libssl1.0-dev
echo "[rbenv] install rbenv and versions"
anyenv install rbenv && . ~/.profile
rbenv install 2.5.8 && rbenv rehash && rbenv global 2.5.8
echo 'gem: --no-document' > ~/.gemrc && gem install bundler
