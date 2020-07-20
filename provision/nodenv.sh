#!/bin/bash

echo "[nodenv] install nodenv and versions"
anyenv install nodenv && . ~/.profile
echo yarn >> $NODENV_ROOT/default-packages
nodenv install 12.18.2 && nodenv rehash && nodenv global 12.18.2
