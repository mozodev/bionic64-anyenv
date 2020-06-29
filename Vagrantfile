# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "bionic64"
    vb.memory = "2048"
  end
  
  config.vm.provision "shell", privileged: false, path: './provision/0-anyenv.sh'
  config.vm.provision "shell", privileged: false, path: './provision/pyenv.sh'
  config.vm.provision "shell", privileged: false, path: './provision/phpenv.sh'
  # config.vm.provision "shell", privileged: false, path: './provision/bionic64-php74.sh'
  config.vm.provision "shell", privileged: false, path: './provision/rbenv.sh'
  config.vm.provision "shell", privileged: false, path: './provision/nodenv.sh'
  config.vm.provision "shell", privileged: false, path: './provision/postgres.sh'

end
