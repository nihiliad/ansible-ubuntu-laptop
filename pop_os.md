# Pop!\_OS

## Installation Notes

* On the ThinkPad X1 Extreme, had to disable Secure Boot, otherwise booting from a flash drive would fail, with the message `(initramfs) unable to find a live medium containing a live file system`.
* Installed Lenovo BIOS version 1.17. (Provide more details!)
* LastPass extension would not install on Firefox (login form would close whenever I clicked on the password field), so installed `chromium-browser`, on which install was successful.
* Installed Google Chrome for UMN apps.
  * `sudo vi /etc/apt/sources.list.d/google-chrome.list`
  * `echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> google-chrome.list`
  * `wget https://dl.google.com/linux/linux_signing_key.pub`
  * `apt-key add linux_signing_key.pub`
  * `apt update && apt install google-chrome-stable` 
* Installed direnv.
  * Copied .envrc settings from old laptop to `/home/naughton/github.com/`.
* Installed vim. 
* Installed network-manager-vpnc-gnome (see WebDev Shared > VPN on UMN Google Drive.)
* Installed tree.
* Installed nautilus-dropbox.
* Installed Dropbox, following instructions from: https://www.dropbox.com/install-linux
  * `cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -`
  * `~/.dropbox-dist/dropboxd &`
* Installed SpiderOak ONE by downloading a .deb from: https://spideroak.com/one/get/
* Installed tilix.
  * Configured tilix according to `roles/tilix/tasks/*.yml`.
* Installed Slack by downloading a .deb from: https://slack.com/downloads/linux
  * Running `sudo apt install ./slack-desktop-3.3.3-amd64.deb` generated the following error:
```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
You might want to run 'apt --fix-broken install' to correct these.
The following packages have unmet dependencies:
 slack-desktop : Depends: gconf2
                 Depends: gconf-service
E: Unmet dependencies. Try 'apt --fix-broken install' with no packages (or specify a solution).
```
  * Running `apt --fix-broken install`, and then re-running the original command, fixed it.
* Installed Atom by downloading a .deb from: https://atom.io/
* Installed Ansible by modifying these instructions: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu
  * `sudo apt update`
  * `sudo apt install software-properties-common`
  * `sudo apt-add-repository --yes --update ppa:ansible/ansible`
  * `sudo apt install ansible`
* Installed ack-grep.
* Installed zsh using my ansible role, and running: `ansible-playbook --ask-become-pass local.yml`
  * Made a few changes to allow running locally, rather than with vagrant.
* Switched the Tilix font to Ubuntu Mono Regular, because the default terminal font for Pop!\_OS is not a powerline-patched font.
