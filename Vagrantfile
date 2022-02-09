# -*- mode: ruby -*-
# vi: set ft=ruby :
# based on https://github.com/freeipa/freeipa-container

Vagrant.configure("2") do |config|

  config.vm.define "freeipaserver" do |vbox|
    config.vm.box = "fedora/35-cloud-base"
    config.vm.box_version = "35.20211026.0"
    vbox.vm.provision :shell, path: "./ipaserver.sh", privileged: true
    vbox.vm.hostname = 'ipaserver.freeipa.local'
    vbox.vm.network :private_network, ip: "192.168.56.101"
    vbox.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2 * 1024 ]
      v.customize ["modifyvm", :id, "--name", "freeipaserver"]
    end
  end
#=============================================================================
config.vm.define "freeipaclient01" do |vbox|
    config.vm.box = "fedora/35-cloud-base"
    config.vm.box_version = "35.20211026.0"
    vbox.vm.hostname = 'ipaclient01.freeipa.local'
    vbox.vm.provision :shell, path: "./ipaclient.sh", privileged: true
    vbox.vm.network :private_network, ip: "192.168.56.110"
    vbox.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2 * 1024 ]
      v.customize ["modifyvm", :id, "--name", "freeipaclient01"]
    end
  end
#=============================================================================
config.vm.define "freeipaclient02" do |vbox|
    config.vm.box = "fedora/35-cloud-base"
    config.vm.box_version = "35.20211026.0"
    vbox.vm.hostname = 'ipaclient02.freeipa.local'
    vbox.vm.provision :shell, path: "./ipaclient.sh", privileged: true
    vbox.vm.network :private_network, ip: "192.168.56.120"
    vbox.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2 * 1024 ]
      v.customize ["modifyvm", :id, "--name", "freeipaclient02"]
    end
  end
#=============================================================================
config.vm.define "freeipareplica01" do |vbox|
    config.vm.box = "fedora/35-cloud-base"
    config.vm.box_version = "35.20211026.0"
   vbox.vm.hostname = 'ipareplica01.freeipa.local'
    vbox.vm.network :private_network, ip: "192.168.56.111"
    vbox.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2 * 1024 ]
      v.customize ["modifyvm", :id, "--name", "freeipareplica01"]
      v.customize ["modifyvm", :id, "--description", "ipa replica 01"]
    end
  end
#=============================================================================
  config.vm.define "ipaDNSclient" do |vbox|
    config.vm.box = "fedora/35-cloud-base"
    config.vm.box_version = "35.20211026.0"

    vbox.vm.hostname = 'dnsclient1.freeipa.local'
    vbox.vm.network :private_network, ip: "192.168.56.114"
    vbox.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2 * 1024 ]
      v.customize ["modifyvm", :id, "--name", "ipaDNSclient"]
      v.customize ["modifyvm", :id, "--description", "DNS Resolver (DNS Client)"]
    end
  end
#=============================================================================
config.vm.define "freeipaDocker" do |vbox|
  config.vm.box = "fedora/35-cloud-base"
  config.vm.box_version = "35.20211026.0"
  config.vm.provision "docker"
  # see https://www.vagrantup.com/docs/provisioning/docker
  vbox.vm.hostname = 'ipaDocker.freeipa.local'
  vbox.vm.network :private_network, ip: "192.168.56.120"
  vbox.vm.synced_folder  '.', '/home/vagrant/freeipa', owner: 'vagrant'
  vbox.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 2 * 1024 ]
    v.customize ["modifyvm", :id, "--name", "ipaDocker"]
  end
end

end
