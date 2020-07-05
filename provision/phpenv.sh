#!/bin/bash

anyenv install phpenv && . ~/.profile
echo -e "--with-pgsql \n--with-pdo-pgsql" >> $(phpenv root)/plugins/php-build/share/php-build/default_configure_options
# dependencies for 7+
sudo apt-get -y -qq install automake bison libxml2-dev libbz2-dev libcurl4-openssl-dev libssl-dev libsasl2-dev libjpeg-dev libpng-dev libmcrypt-dev libreadline-dev libtidy-dev libxslt-dev re2c pkg-config lemon libkrb5-dev libsqlite3-dev libzip-dev libmcrypt4 zip unzip libpq-dev
# dependencies for 7.4
sudo apt-get -y -qq install libonig-dev
phpenv install 7.3.19 && phpenv rehash && phpenv global 7.3.19
phpenv install 7.4.7

echo "[php] install drush launcher and drush 8 for drupal 7"
wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
chmod +x drush.phar && sudo mv drush.phar /usr/local/bin/drush
wget -O drush8.phar https://github.com/drush-ops/drush/releases/download/8.3.2/drush.phar
chmod +x drush8.phar && sudo mv drush8.phar /usr/local/bin/drush8

echo "[php] install wp-cli globally"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp
