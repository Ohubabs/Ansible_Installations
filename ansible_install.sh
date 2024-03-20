#!/bin/bash
sudo hostnamectl set-hostname ansible
sudo timedatectl set-timezone American/Los_Angeles
sudo adduser ansible
sudo apt update -y
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
sudo su - ansible
sudo apt update -y
sudo chown -R ansible:ansible /etc/ssh/sshd_config
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service ssh restart
sudo apt update -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt install ansible -y
