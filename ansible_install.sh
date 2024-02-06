#!/bin/bash
sudo hostnamectl set-hostname ansible
sudo timedatectl set-timezone American/Los_Angeles
sudo adduser ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
sudo su - ansible
sudo apt update -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt install ansible -y
sudo chown ansible:ansible -R /etc/ansible/
