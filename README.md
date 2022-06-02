# Ubuntu 22.04 VM in VMware Workstation Player

## Create VM and Install Ubuntu

* Download [Ubuntu Desktop](https://www.ubuntu.com/download/desktop)
* Download [VMware Workstation Player](https://www.vmware.com/ca/products/workstation-player/workstation-player-evaluation.html)
* open `%APPDATA%\VMware\preferences.ini` and add

```ini
pref.vmplayer.fullscreen.nobar = "TRUE"
```

* Change memory and processors settings
* In display settings, set recommended video memory
* Install Ubuntu. Choose minimal installation and not to install Third-party drivers.

## Setup/Configuration

Run terminal and set white on black color scheme. Then run

```bash
sudo su
USERNAME="[username]"
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
apt update
apt upgrade -y
apt install git -y
exit
```

Create a key with

```bash
EMAIL="[email]"
ssh-keygen -t rsa -C "$EMAIL" -N ""
cat ~/.ssh/id_rsa.pub
```

Add key on the GitHub [SSH and GPG keys settings page](https://github.com/settings/keys)

Then run

```bash
git clone git@github.com:desecho/ubuntu-vm.git
cd ubuntu-vm
```

If you want to install [VS Code](https://code.visualstudio.com/) run

```bash
vs_code/install_vs_code.sh
```

If you want to install the "Dash to panel" GNOME extension run

```bash
make install-gnome-shell-extensions
```

* Download [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/) extension
* Run:

```bash
ARCHIVE="[archive-name.zip]"
DIR=~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com
unzip "$ARCHIVE" -d "$DIR"
```

If necessary - logout and log back in.

Run Extensions.

* Extensions → enable `Dash to panel`
* `Dash to panel` settings → `Behavior` → enable `Isolate Workspaces`

Run this if you want to install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh):

```bash
make install-oh-my-zsh
```

Install Ansible:

```bash
make install-ansible
```

Then you need to configure the variables in `ansible/vars.yml`.

You might also want to change variables in `ansible/roles/main/defaults/main.yml`.

Then run

```bash
make provision
sudo reboot
```

To prevent screen from going to sleep mode or locking, open Settings.

* Power → `Screen blank` → `Never`
* Privacy → `Screen` → `Automatic Screen Lock` → `Off`
* Privacy → `Screen` → `Lock Screen on Suspend` → `Off`

## Included packages

### Languages

* [Python](https://www.python.org/)
* [Go](https://golang.org/)
* [Node.js](https://nodejs.org/en/)

### Package Managers

* [pip](https://pypi.org/project/pip/)
* [yarn](https://yarnpkg.com/)

### Utils

* [Ansible](https://www.ansible.com/)
* [Midnight Commander](https://midnight-commander.org/)
* [curl](https://curl.se/)
* [tox](https://tox.readthedocs.io/en/latest/)
* [net-tools](https://sourceforge.net/projects/net-tools/)
* [locate](https://www.gnu.org/software/findutils/)
* [TFLint](https://github.com/terraform-linters/tflint)
* [jq](https://stedolan.github.io/jq/)
* [yq](https://mikefarah.gitbook.io/yq/)
* [pwgen](https://linux.die.net/man/1/pwgen)
* [S3cmd](https://s3tools.org/s3cmd)
* [ngrok](https://ngrok.com/)
* [ncdu](https://dev.yorhel.nl/ncdu)
* [thefuck](https://github.com/nvbn/thefuck)
* [Unattended Upgrades](https://wiki.debian.org/UnattendedUpgrades)
* [exa](https://the.exa.website/)
* [bat](https://github.com/sharkdp/bat)
* [fx](https://github.com/antonmedv/fx)
* [yh](https://github.com/andreazorzetto/yh)
* [shellcheck](https://www.shellcheck.net/)
* [shfmt](https://github.com/mvdan/sh)
* [yamllint](https://github.com/adrienverge/yamllint)
* [restructuredtext-lint](https://pypi.org/project/restructuredtext-lint/)
* [JSON Lint](https://github.com/zaach/jsonlint)
* [Haskell Dockerfile Linter](https://github.com/hadolint/hadolint/)
* [markdown-link-check](https://github.com/tcort/markdown-link-check)

### Monitoring

* [bpytop](https://github.com/aristocratos/bpytop)
* [iftop](https://linux.die.net/man/8/iftop)
* [iotop](https://linux.die.net/man/1/iotop)

### Kubernetes

* [kubectl](https://kubernetes.io/docs/reference/kubectl/)
* [Helm](https://helm.sh/)

### Databases

* [mysql-client](https://dev.mysql.com/doc/refman/8.0/en/mysql.html)
* [DBeaver](https://dbeaver.io/)

### Docker

* [Docker Compose](https://docs.docker.com/compose/)
* [Docker](https://www.docker.com/)

### Digital Ocean

* [doctl](https://docs.digitalocean.com/reference/doctl/)

### Browsers

* [Chromium](https://www.chromium.org/Home)
