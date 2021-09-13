# Ubuntu 20.04 VM in Virtualbox

## Create VM and Install Ubuntu

* Download [Ubuntu Live CD](https://www.ubuntu.com/download/desktop)
* Create a new VM

Open VM settings

* User Interface → Uncheck Show in Full-screen/Seamless
* Display → Enable 3D Acceleration
* Display → Graphics controller → VBoxSVGA
* System → Motherboard → Base Memory → Set to the desired value
* System → Processor → Select the maximum number of cores you have
* General → Advanced
  * Shared Clipboard → Bidirectional
  * Drag'n'Drop → Bidirectional

Install Ubuntu Desktop. Choose minimal installation.

## Setup/Configuration

Run
```bash
USERNAME="[username]"
sudo su
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
apt update
apt upgrade -y
apt install git make gcc perl -y
```

* Select Devices → Insert Guest Additions CD image

Run the autostart script (it will pop up).

* Select Devices → Optical Drives → Remove disk from virtual drive
* Restart the VM

Remove from favorites:

* Help

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
```

If you want to install [VS Code](https://code.visualstudio.com/) run
```bash
vs_code/install_vs_code.sh
```

If you have a 4K display and the cursor size is not right run
```bash
sudo apt install dconf-editor
```
Run Dconf Editor, go to org → gnome → desktop → interface → cursor-size → change the value accordingly.

Note: Value `21` worked for my setup

To configure scaling, open Screen Display, and select scale.

If you want to enable the "Dash to panel" GNOME extension run
```bash
sudo apt install gnome-tweak-tool gnome-shell-extension-dash-to-panel -y
sudo reboot
```

Run Tweaks
* Disable animations
* Extensions → enable "Dash to panel"
* "Dash to panel" settings → Behavior → enable Isolate Workspaces

Run this if you want to install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh):
```bash
./install_oh_my_zsh.sh
```

Install Ansible:
```bash
ansible/install_ansible.sh
```

Then you need to configure the variables in `ansible/vars.yml`.

You might also want to change variables in `ansible/roles/main/defaults/main.yml`.

Then run
```bash
ansible/provision.sh
sudo reboot
```

To prevent screen from going to sleep mode or locking, open Settings.

* Power → Blank screen → Never
* Privacy → Screen Lock → Automatic Screen Lock → Off
* Privacy → Screen Lock → Lock Screen on Suspend → Off
* Privacy → Screen Lock → Blank Screen Delay → Never

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
* [Terminator](https://gnome-terminator.org/)
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
