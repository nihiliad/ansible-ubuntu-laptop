# ansible-ubuntu-laptop

Use Ansible to install and configure software on a laptop running Ubuntu.

## Quick Start

### Install Ansible

```
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

### Clone this Repo

```
git clone git@github.com:nihiliad/ansible-ubuntu-laptop.git
```

### Run

```
cd ansible-ubuntu-laptop
ansible-playbook --ask-become-pass local.yml
```

## Testing with GNOME Boxes

### Host OS

Run the `boxes` role in this repo to install and configure Boxes:

```
ansible-playbook --ask-become-pass --tags "boxes" local.yml
```

### Guest OS

Install packages to allow running the code in this repo via a shared folder:

```
sudo apt install spice-vdagent spice-webdavd
```

Share this repository folder in the guest. The location should be something like...

```
/run/user/1000/gvfs/dav+sd\:host\=Spice%2520client%2520folder._webdav._tcp.local/
```

Then [install Ansible](#install-ansible) and [run](#run). Helps to take snapshots of intermediate states, test, restore, and iterate.
