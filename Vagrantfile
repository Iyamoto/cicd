# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.define :cicd do |cicd|
    cicd.vm.box = "centos/7"
    cicd.vm.box_version = "1708.01"
    cicd.vm.provider "virtualbox" do |v|
      v.memory = 2048
	  v.cpus = 1
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]  	  
    end
    cicd.vm.hostname = "cicd"
    cicd.vm.network "private_network", ip: "10.100.199.200"
	cicd.vm.provision :shell, path: "scripts/bootstrap_ansible.sh"
	cicd.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/cicd.yml -c local"
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end