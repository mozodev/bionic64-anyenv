# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 1313, host: 1313, id: "hugo_dev"
  # config.vm.network "forwarded_port", guest: 3306, host: 3306, id: "mysql_family"
  # config.vm.network "forwarded_port", guest: 5432, host: 5432, id: "postgresql"
  # config.vm.network "forwarded_port", guest: 8888, host: 8888, id: "php_dev"
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vbguest.auto_update = false
  # config.vm.synced_folder ".", "/vagrant", nfs: true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "bionic64"
    vb.cpus = 4
    vb.memory = 2048
  end
  
  config.vm.provision "shell", privileged: false, path: './provision/0-anyenv.sh'
  config.vm.provision "shell", privileged: false, path: './provision/dbdeployer.sh'
  config.vm.provision "shell", privileged: false, path: './provision/postgres.sh'
  config.vm.provision "shell", privileged: false, path: './provision/rbenv.sh'
  config.vm.provision "shell", privileged: false, path: './provision/nodenv.sh'
  config.vm.provision "shell", privileged: false, path: './provision/phpenv.sh'
  config.vm.provision "shell", privileged: false, path: './provision/pyenv.sh'
  config.vm.provision "shell", path: './provision/9-cleanup.sh'
  config.vm.provision "shell", privileged: false, path: './provision/9-test.sh'

end
