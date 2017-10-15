#!/bin/bash

set -e

echo "Installing Ansible..."
sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y ansible
cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg