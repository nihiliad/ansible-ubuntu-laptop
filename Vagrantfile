# This guide is optimized for Vagrant 1.7 and above.
# # Although versions 1.6.x should behave very similarly, it is recommended
# # to upgrade instead of disabling the requirement below.
Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu-unity-xenial"

  # This probably only exists on my T420s.
  #config.vm.box = "ubuntu-unity-xenial-16.04.1"

  #config.vm.box = "boxcutter/ubuntu1604-desktop"

  # TODO: Do I still need this for Ubuntu?
  # Disable the new default behavior introduced in Vagrant 1.7, to
  # ensure that all Vagrant machines will use the same SSH key pair.
  # See https://github.com/mitchellh/vagrant/issues/5005
  config.ssh.insert_key = false

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end

  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end
end
