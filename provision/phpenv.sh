#!/bin/bash

. ~/.bashrc && anyenv install phpenv
sudo apt-get -y -qq install automake bison libxml2-dev libbz2-dev libcurl4-openssl-dev libssl-dev libsasl2-dev libjpeg-dev libpng-dev libmcrypt-dev libreadline-dev libtidy-dev libxslt-dev re2c pkg-config lemon libkrb5-dev libsqlite3-dev libzip-dev libmcrypt4 zip unzip
phpenv install 7.3.19 && phpenv rehash && phpenv global 7.3.19
