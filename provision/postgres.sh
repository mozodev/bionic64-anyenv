#!/bin/bash

sudo apt-get -y -qq install postgresql && psql -V
sudo runuser -l postgres -c 'psql -c "ALTER USER \"postgres\" WITH PASSWORD '"'"'postgres'"'"';"'
sudo runuser -l postgres -c 'psql -c "CREATE DATABASE project TEMPLATE=\"template0\" ENCODING='"'"'utf8'"'"';"'

# ALTER USER "postgres" WITH PASSWORD 'postgres';
# CREATE DATABASE {{ project }} TEMPLATE="template0" ENCODING='utf8';
