# ThinkPad X1 2025 notes

## Installed so far

### OS

* Pop OS 24.04 Alpha 7

### Installed via apt

* ack 
* tree

### Installed (semi-)manually

* Chrome
* Slack
* Zoom

### ghostty

In lots of environments, [terminfo doesn't know about ghostty](https://ghostty.org/docs/help/terminfo).
When using ssh, I got errors like, `WARNING: terminal is not fully functional`, and had no color except white.

As desribed at the link above, I fixed that by adding entries like this to `~/.ssh/config`:

```
Host *.example.com
  SetEnv TERM=xterm-256color
```


### Oracle InstantClient

#### Prerequisites

```
sudo apt install alien
```

Apparently Ubuntu doesn't provide the libaio1 package anymore as of 24.04: https://community.localwp.com/t/unable-to-install-on-ubuntu-24-04-lts-due-to-missing-dependency/43709/9

```
wget http://launchpadlibrarian.net/646633572/libaio1_0.3.113-4_amd64.deb
sudo apt install ./libaio1_0.3.113-4_amd64.deb
```

#### Oracle downloads

Get download links from: https://www.oracle.com/bz/database/technologies/instant-client/linux-x86-64-downloads.html

```
wget https://download.oracle.com/otn_software/linux/instantclient/2380000/oracle-instantclient-basic-23.8.0.25.04-1.el9.x86_64.rpm
sudo alien -i oracle-instantclient-basic-23.8.0.25.04-1.el9.x86_64.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/2380000/oracle-instantclient-sqlplus-23.8.0.25.04-1.el9.x86_64.rpm
sudo alien -i oracle-instantclient-sqlplus-23.8.0.25.04-1.el9.x86_64.rpm
export LD_LIBRARY_PATH=/usr/lib/oracle/23/client64/lib/:$LD_LIBRARY_PATH
```

### Oracle SQL Developer

#### Prerequisites

```
sudo apt install openjdk-21-jdk
```

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

### Installed with apt

* network-manager-openconnect-gnome
* libwebkit2gtk-4.1-0
  * What was the above for?
* neofetch
* libsqlite3-dev sqlite3 just cargo libxkbcommon-dev git-lfs
  * What were the above for?
* gnome-session
* direnv
* gnome-shell-extension-manager
  * clipboard-indicator
* alien
* libxml2-utils
  * The above is for xmllint

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

In `.zshrc`, add the above plugins to the already-existing plugins list.

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

### direnv

See the direnv role in this repo.

### anyenv

```
apt install git build-essential libffi-dev libssl-dev openssl zlib1g-dev curl libbz2-dev liblzma-dev libncursesw5-dev libreadline-dev libsqlite3-dev libxml2-dev libxmlsec1-dev llvm make tk-dev wget xz-utils
git clone https://github.com/anyenv/anyenv ~/.anyenv
mkdir -p ~/.config/anyenv
git clone https://github.com/anyenv/anyenv-install ~/.config/anyenv/anyenv-install
eval "$(~/.anyenv/bin/anyenv init -)"
vi ~/.oh-my-zsh/custom/anyenv.zsh
```

Use the template in the anyenv role in this repo to fill in the content for the above file.

```
anyenv install nodenv
anyenv install pyenv
anyenv install rbenv
```

### pyenv

```
pyenv install 3.12.11
pyenv rehash
```

### poetry

```
apt install python3-pip pipx
pipx install --suffix=@2.1.3 poetry==2.1.3
vi ~/.oh-my-zsh/custom/poetry.zsh
```

Use the template in the poetry role in this repo to fill in the content for the above file.

```
poetry@2.1.3 config virtualenvs.in-project true
```

### Screen sharing on Wayland

```
apt install xdg-desktop-portal-gnome
```

Add `enableWaylandShare=true` to `~/.config/zoomus.conf`.

### Terraform

From: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Install prereqs:

```
apt install gnupg software-properties-common
```

Install HashiCorp's GPG key:

```
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

Verify the GPG key's fingerprint.

```
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```

Add the official HashiCorp repository to your system.

```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

Update apt to download the package information from the HashiCorp repository and install Terraform from the new repo:

```
apt update && apt install terraform
```

Install the autocomplete package:

```
terraform -install-autocomplete
```

### snap

`apt install snapd`

### aws cli

```
snap install aws-cli --classic
aws --version
```
