#!/bin/bash

echo "[nodenv] install nodenv and versions"
source ~/.profile && anyenv install nodenv && source ~/.profile
echo yarn >> $NODENV_ROOT/default-packages
nodenv install 12.18.0 && nodenv rehash && nodenv global 12.18.0
