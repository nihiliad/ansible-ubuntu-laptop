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


#### Install Boxes

Run the `boxes` role in this repo to install and configure Boxes:

```
ansible-playbook --ask-become-pass --tags "boxes" local.yml
```

#### Create a new vritual machine

Run Boxes and create a new virtual machine, probably by choosing "Operating System Image
File" under "Select an OS Source", to use a previously downloaded ISO file. Accept the
defaults, then Boxes will start a new virtual machine, running the installer for the
[Guest OS](#guest-os).

### Guest OS

#### Install the guest OS

Follow the prompts in the installer.

**Waring!** Do _not_ encrypt the drive for the host OS! This has made several virtual
machines, including Pop!_OS 20.04 and 21.10, impossible to shut down and restart with Boxes.

#### Share this repo folder in the guest OS

Install packages to allow running the code in this repo via a shared folder, then reboot:

```
sudo apt install spice-vdagent spice-webdavd
sudo shutdown -r now
```

Share this repository folder in the guest. The location should be something like...

```
/run/user/1000/gvfs/dav+sd\:host\=Spice%2520client%2520folder._webdav._tcp.local/
```

In Nautilus, click on '+Other Locations'. That will start a search, which will discover the 'Spice client folder'. Click on that to share this folder.

Then [install Ansible](#install-ansible) and [run](#run). Helps to take snapshots of intermediate states, test, restore, and iterate.
