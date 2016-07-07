#!/usr/bin/env bash

apt update

# For Ansible:
apt install -y python

# Because the Ubuntu base box lacks Unity, and without this Ubuntu will
# not build all the VirtualBox guest additions:
apt install -y unity

# For the VirtualBox guest additions:
# TODO: Make the VirtualBox version configurable!
apt install -y build-essential module-assistant dkms
m-a prepare
wget http://download.virtualbox.org/virtualbox/5.0.14/VBoxGuestAdditions_5.0.14.iso -P /tmp
sudo mount -o loop /tmp/VBoxGuestAdditions_5.0.14.iso /mnt
sh /mnt/VBoxLinuxAdditions.run

#if ! [ -L /var/www ]; then
#  rm -rf /var/www
#  ln -fs /vagrant /var/www
#fi
