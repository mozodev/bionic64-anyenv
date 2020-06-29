#!/bin/bash
sudo apt-get -y -qq install postgresql
postgres -V
sudo runuser -l postgres -c 'psql -c "ALTER USER \"postgres\" WITH PASSWORD '"'"'postgres'"'"';"'
sudo runuser -l postgres -c 'psql -c "CREATE DATABASE try9 TEMPLATE=\"template0\" ENCODING='"'"'utf8'"'"';"'
