#!/usr/bin/env bash

apt update

# For Ansible:
apt install -y python

# Prevent `vagrant ssh` from asking for a password (TODO: Put this in the vagrant box!)
curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys

# These should already be installed in the guest box--now unnecessary.
# For the VirtualBox guest additions:
# TODO: Make the VirtualBox version configurable!
#apt install -y build-essential module-assistant dkms
#m-a prepare
#wget http://download.virtualbox.org/virtualbox/5.0.14/VBoxGuestAdditions_5.0.14.iso -P /tmp
#sudo mount -o loop /tmp/VBoxGuestAdditions_5.0.14.iso /mnt
#sh /mnt/VBoxLinuxAdditions.run
