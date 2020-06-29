#!/bin/bash
echo "[mysql] install dbdeployer and dependencies"
sudo apt-get -y -qq install libaio1 libaio-dev
VERSION=1.46.0
OS=linux
origin=https://github.com/datacharmer/dbdeployer/releases/download/v$VERSION
wget -qO- $origin/dbdeployer-$VERSION.$OS.tar.gz | tar xvz
chmod +x dbdeployer-$VERSION.$OS && sudo mv dbdeployer-$VERSION.$OS /usr/local/bin/dbdeployer

echo "[mysql] install 5.7.26, 8.0.19"
# https://downloads.mysql.com/archives/community/ linux - generic
mkdir -p opt/mysql
dbdeployer downloads get-unpack mysql-5.7.26.tar.xz --delete-after-unpack
dbdeployer deploy single 5.7.26
dbdeployer downloads get-unpack mysql-8.0.19-linux-x86_64-minimal.tar.xz --delete-after-unpack
dbdeployer deploy single 8.0.19
