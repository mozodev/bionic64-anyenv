# mozodev/bionic64-anyenv

A vagrant box for web development on ubuntu bionic64 (virtualbox).

- [virtualbox](https://virtualbox.org) 6.1.10
- [anyenv](https://github.com/anyenv/anyenv)
- [hugo](https://github.com/gohugoio/hugo)
- [dbdeployer](https://github.com/datacharmer/dbdeployer)
- [postgresql](https://github.com/postgres/postgres) > postgresql 10.12
- [rbenv](https://github.com/rbenv/rbenv) > ruby 2.5.8, bundler
- [nodenv](https://github.com/nodenv/nodenv) > node 12.18.1, yarn
- [phpenv](https://github.com/phpenv/phpenv) > php 7.3.19, 7.4.7 composer, drush-launcher, wp-cli
- [pyenv](https://github.com/pyenv/pyenv) > python 3.8.2

## build vagrant box

```zsh
# use
$ time vagrant up #

# build box
$ time vagrant halt && time vagrant package --output bionic64-anyenv-v0.1.0.box && md5 bionic64-anyenv-v0.1.0.box
# add box
$ time vagrant box add mozodev/bionic64-anyenv ./bionic64-anyenv-v0.1.0.box
# deploy
$ time aws s3 cp ./bionic64-anyenv-v0.1.0.box s3://mozodev/public/
```

## [mysql] [dbdeployer](https://github.com/datacharmer/dbdeployer/)

DBdeployer is a tool that deploys MySQL database servers easily (sandboxed).
documentation: <https://www.dbdeployer.com/>

```bash
# install specific mysql version
vagrant@bionic64-anyenv:~$ dbdeployer downloads get-unpack mysql-5.7.26.tar.xz --delete-after-unpack
vagrant@bionic64-anyenv:~$ dbdeployer deploy single 5.7.26

# status, start, stop, restart, use
vagrant@bionic64-anyenv:~$ ~/sandboxes/msb_5_7_26/status
vagrant@bionic64-anyenv:~$ ~/sandboxes/msb_5_7_26/start
vagrant@bionic64-anyenv:~$ ~/sandboxes/msb_5_7_26/stop
vagrant@bionic64-anyenv:~$ ~/sandboxes/msb_5_7_26/restart
vagrant@bionic64-anyenv:~$ ~/sandboxes/msb_5_7_26/use

[client]
user               = root
password           = msandbox
port               = 5726
socket             = /tmp/mysql_sandbox5726.sock
```

vagrant package --output bionic64-anyenv-v0.1.0.box  43.63s user 2.63s system 21% cpu 3:32.41 total
MD5 (bionic64-anyenv-v0.1.0.box) = 723469ba8243e859fabeee2d98e022fe

cd /vagrant/web

php ./core/scripts/drupal quick-start standard

chmod +w web/sites/default
drush si standard --site-name=drupal 8 --locale=ko --db-url=pgsql://postgres:postgres@127.0.0.1/d8

chmod +w web/sites/default
drush si standard --site-name=drupal 9 --locale=ko --db-url=pgsql://postgres:postgres@127.0.0.1/d9

```bash
#1 [OS]
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.4 LTS
Release:        18.04
Codename:       bionic

#2 [disk]
/dev/sda1   9.7G  2.9G  6.8G  30% /

#3 [dbdeployer]
Basedir: /home/vagrant/opt/mysql
8.0.19  

#4 [postgresql]
psql (PostgreSQL) 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

#5 [anyenv]
nodenv: 12.18.1 (set by /home/vagrant/.anyenv/envs/nodenv/version)
phpenv: 7.3.19 (set by /home/vagrant/.anyenv/envs/phpenv/version)
pyenv: 3.8.2 (set by /home/vagrant/.anyenv/envs/pyenv/version)
rbenv: 2.5.8 (set by /home/vagrant/.anyenv/envs/rbenv/version)
```