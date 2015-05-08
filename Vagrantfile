# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 9000, host: 9001
  config.vm.network :forwarded_port, guest: 35729, host: 35729

  config.vm.provision "shell", path: "tools/provision.sh"
end
