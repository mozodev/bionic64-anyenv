#!/bin/bash
echo "[php] install php 7.4"
yes | sudo add-apt-repository ppa:ondrej/php && sudo apt-get update
sudo apt-get install -y -qq zip unzip php7.4-{cli,gd,xml,curl,mbstring,zip,opcache,apcu,mysql,pgsql,fpm}

echo "[php] install drush launcher and drush 8 for drupal 7"
wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
chmod +x drush.phar && sudo mv drush.phar /usr/local/bin/drush
wget -O drush8.phar https://github.com/drush-ops/drush/releases/download/8.3.2/drush.phar
chmod +x drush8.phar && sudo mv drush8.phar /usr/local/bin/drush8

echo "[php] install wp-cli globally"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp

echo "[php] install composer"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

