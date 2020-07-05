#!/bin/bash

echo "[pyenv] install pyenv and 3.8.2"
anyenv install pyenv && . ~/.profile
sudo apt-get install -y -qq zlib1g-dev libffi-dev libbz2-dev libreadline-dev libssl1.0-dev libsqlite3-dev
pyenv install 3.8.2 && pyenv rehash && pyenv global 3.8.2
pip install --upgrade pip
