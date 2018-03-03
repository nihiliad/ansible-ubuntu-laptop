Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|
  config.vm.box = ENV['VAGRANT_BOX'] || 'ubuntu-17.10-desktop'

  # Disable the new default behavior introduced in Vagrant 1.7, to
  # ensure that all Vagrant machines will use the same SSH key pair.
  # See https://github.com/mitchellh/vagrant/issues/5005
  config.ssh.insert_key = false

  config.vm.provision 'ansible' do |ansible|
    ansible.verbose = 'v'
    ansible.playbook = ENV['ANSIBLE_PLAYBOOK'] || 'local.yml'
    ansible.raw_arguments = Shellwords.shellsplit(ENV['ANSIBLE_ARGS']) if ENV['ANSIBLE_ARGS']
  end

  config.vm.provider 'virtualbox' do |v|
    v.name = 'ansible-ubuntu-laptop'
    v.gui = true
  end
end
