# T440p 2026 notes

## Installed so far

### OS

* Ubuntu 26.04

### Swapped Esc and CapsLock

  * Because the Esc key is broken on this machine, re-mapped CapsLock to Esc
  * `sudo apt install gnome-tweaks`
  * In Gnome Tweaks: Keyboard > Additional Layout Options > Caps Lock behavior > Swap Esc and Caps Lock
  * Reboot

### Installed (semi-)manually

With Chrome and Firefox will come access to a password manager, which will allow for easier access to other resources.

* Chrome
  * Followed most of these instructions: https://oneuptime.com/blog/post/2026-03-02-how-to-install-google-chrome-on-ubuntu/view
  ```bash
  apt install wget apt-transport-https
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb
  ```

* Firefox
  * Removed the snap and installed a deb by following these instructions: https://www.omgubuntu.co.uk/2022/04/how-to-install-firefox-deb-apt-ubuntu-22-04

* Slack
  * Downloaded deb from: https://slack.com/downloads/instructions/linux?ddl=1&build=deb
  * `apt install slack-desktop-x.y.z-amd64.deb`

### Zoom

* Downloaded deb from: https://umn.zoom.us/download
* `sudo apt install zoom_amd64.deb`
* When starting zoom, got this error: `/opt/zoom/zoom: error while loading shared libraries: libOpenGL.so.0: cannot open shared object file: No such file or directory`
* Running `sudo apt -f install zoom_amd64.deb`, to fix broken dependencies, didn't fix it. This did: `sudo apt install libopengl0`

* Screen sharing on Wayland
  * `apt install xdg-desktop-portal-gnome`
  * Add `enableWaylandShare=true` to `~/.config/zoomus.conf`.

### Dirty Frag manual fix

Followed these instructions: https://ubuntu.com/blog/dirty-frag-linux-vulnerability-fixes-available

### Installed via apt

Enables installation and management of extensions without web browser plugins:
* gnome-shell-extension-manager

From the ansible-ubuntu-laptop anyenv role:
* git
* build-essential
* libffi-dev
* libssl-dev
* openssl
* zlib1g-dev

* curl
* tree
* vim
* vlc

### Copyous clipboard manager

Requires `gnome-shell-extension-manager`, installed above, as well as...

```bash
sudo apt install gir1.2-gda-5.0 gir1.2-gsound-1.0
```

Open Extension Manager, search for Copyous, and install.

### direnv

* Followed these instructions: https://direnv.net/docs/hook.html
* `sudo apt install direnv`
* Added `eval "$(direnv hook bash)"` to `~/.bashrc`.
* Re-started bash
* TODO: Investigate env vars for git. Those I have been using, `GIT_COMMITTER_EMAIL` and `GIT_COMMITTER_NAME`, seem to be ignored.

### ssh keys

Getting the full private key seems to require opening the password manager vault in its own window.

### clone this repo

After git is installed and ssh keys are in place, clone this repo with: `git clone git@github.com:nihiliad/ansible-ubuntu-laptop.git`

### zsh and oh-my-zsh

```
sudo apt install  zsh
sudo chsh -s /bin/zsh $USER
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cd ~/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
vi ~/.zshrc
```

Note: `chsh` will not take effect until logging out and back in.

### ghostty

Now in the official repos: `apt install ghostty`

In lots of environments, [terminfo doesn't know about ghostty](https://ghostty.org/docs/help/terminfo).
When using ssh, I got errors like, `WARNING: terminal is not fully functional`, and had no color except white.

As desribed at the link above, I fixed that by adding entries like this to `~/.ssh/config`:

```
Host *.example.com
  SetEnv TERM=xterm-256color
```

### Nerd font

```
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
unzip FiraCode.zip && rm FiraCode.zip
fc-cache -fv
```

Configure ghostty to use the above font:

```
ghostty +list-fonts
mkdir -p ~/.config/ghostty
vi ~/.config/ghostty/config
```

Set `font-family = ` appropriately, e.g., `font-family = "FiraCode Nerd Font Mono"`

### Starship

```
curl -sS https://starship.rs/install.sh | sh
starship preset pastel-powerline -o ~/.config/starship.toml
vi ~/.zshrc
```

Add `eval "$(starship init zsh)"` at the end of the file.

### Vim with Powerline

```
sudo apt install powerline vim
mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/plugged
```

Created `~/.vimrc` based on the template in the vim role in this repo.

### anyenv

* Prerequisites
  * `apt install git build-essential libffi-dev libssl-dev openssl zlib1g-dev curl libbz2-dev liblzma-dev libncursesw5-dev libreadline-dev libsqlite3-dev libxml2-dev libxmlsec1-dev llvm make tk-dev wget xz-utils`

* Instructions adapted from: https://anyenv.github.io/
```bash
git clone https://github.com/anyenv/anyenv ~/.anyenv
mkdir -p ~/.config/anyenv
git clone https://github.com/anyenv/anyenv-install ~/.config/anyenv/anyenv-install
eval "$(~/.anyenv/bin/anyenv init -)"
```
* zsh config
  * `vi ~/.oh-my-zsh/custom/anyenv.zsh`
  * Use the template in the anyenv role in this repo to fill in the content for the above file.

### pyenv

```
anyenv install pyenv
pyenv install 3.12.11
pyenv rehash
```

### poetry

```
apt install python3-pip pipx
pipx install --suffix=@2.4.1 poetry==2.4.1
```

* zsh config
  * `vi ~/.oh-my-zsh/custom/poetry.zsh`
  * Use the template in the poetry role in this repo to fill in the content for the above file.

```
poetry@2.4.1 config virtualenvs.in-project true
poetry@2.4.1 config --list
```

### VPN

`apt install openconnect`

Will `network-manager-openconnect-gnome` work on Ubuntu 26.04?

### Oracle InstantClient

#### Prerequisites

```
sudo apt install alien
```

Apparently Ubuntu doesn't provide the libaio1 package anymore as of 24.04: https://community.localwp.com/t/unable-to-install-on-ubuntu-24-04-lts-due-to-missing-dependency/43709/9

Update: Is this true for Ubuntu 26.04? Running `apt search libaio1` returns:

```
libaio1t64/resolute,now 0.3.113-8build1 amd64 [installed,automatic]
  Linux kernel AIO access library - shared library
```

We'll try not installing the package below and see what happens.


```
wget http://launchpadlibrarian.net/646633572/libaio1_0.3.113-4_amd64.deb
sudo apt install ./libaio1_0.3.113-4_amd64.deb
```

#### Oracle downloads

Get download links from: https://www.oracle.com/bz/database/technologies/instant-client/linux-x86-64-downloads.html

```
wget https://download.oracle.com/otn_software/linux/instantclient/2326200/oracle-instantclient-basic-23.26.2.0.0-1.el10.x86_64.rpm
sudo alien -i oracle-instantclient-basic-23.26.2.0.0-1.el10.x86_64.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/2326200/oracle-instantclient-sqlplus-23.26.2.0.0-1.el10.x86_64.rpm
sudo alien -i oracle-instantclient-sqlplus-23.26.2.0.0-1.el10.x86_64.rpm
export LD_LIBRARY_PATH=/usr/lib/oracle/23/client64/lib/:$LD_LIBRARY_PATH
```

### Oracle SQL Developer

#### Prerequisites

```
sudo apt install openjdk-25-jdk
```

Using the above newest jdk, got this error when starting sqldeveloper:

```
OpenJDK 64-Bit Server VM warning: Options -Xverify:none and -noverify were deprecated in JDK 13 and will likely be removed in a future release.
Error occurred during initialization of VM
java.lang.Error: A command line option has attempted to allow or enable the Security Manager. Enabling a Security Manager is not supported.
        at java.lang.System.initPhase3(java.base@25.0.3-ea/System.java:1970)
```

Trying the older jdk I installed on the ThinkPad X1 to see if that solves the problem:

```
sudo apt install openjdk-21-jdk
```

The older jdk works! Had to run `apt --purge autoremove` to make sure sqldeveloper did not try to
use the newer jdk, though.

#### Oracle downloads

Get download links from: https://www.oracle.com/database/sqldeveloper/technologies/download/

```
wget https://download.oracle.com/otn_software/java/sqldeveloper/sqldeveloper-24.3.1-347.1826.noarch.rpm
sudo alien -i sqldeveloper-24.3.1-347.1826.noarch.rpm
```

#### sqldeveloper.desktop

This file, which is necessary for the GNOME launcher to find it, does not seem to be created
automatically upoon install with `alien`, so we create it manually...

```
sudo vi /usr/share/applications/sqldeveloper.desktop
```

...with this content:

```
[Desktop Entry]
Name=SQL Developer
Comment=Oracle SQL Developer
GenericName=SQL Developer for Linux
Exec=/opt/sqldeveloper/sqldeveloper.sh
Type=Application
Categories=Developer;
Icon=/opt/sqldeveloper/icon.png
```
