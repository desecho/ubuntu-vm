# Ubuntu 20.04 VM in Virtualbox

It has the following packages pre-installed:

* Docker
* Ansible
* pip
* terminator
* mc
* curl
* htop
* iftop
* kubectl
* tox
* isort
* black
* Go
* docker-compose

## Install Ubuntu

* Download [Ubuntu Live CD](https://www.ubuntu.com/download/desktop).
* Create a new VM.

Open VM settings

* User Interface -> Uncheck Show in Full-screen/Seamless.
* Display -> Enable 3D Acceleration
* Display -> Graphics controller -> VBoxVGA
* System -> Motherboard -> Base Memory -> Set to the desired value
* System -> Processor -> Select maximum number of cores you have
* General -> Advanced -> Shared Clipboard -> Bidirectional

Install Ubuntu Desktop. Choose minimal installation.

Run
```bash
sudo echo "[username] ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo apt update
sudo apt upgrade -y
sudo apt install git make gcc perl -y
```

* Select Devices -> Insert Guest Additions CD image.

Eject the CD

Remove from favorites:

* Ubuntu Software
* Help

Create a key with
```bash
ssh-keygen -t rsa -C [email] -N ''
cat ~/.ssh/id_rsa.pub
```

Add key on the [github key settings page](https://github.com/settings/keys)

Then run
```bash
git clone git@github.com:desecho/vm.git
```

If you want to install VS Code run
```bash
vs_code/install_vs_code.sh
```

If you have a 4k display run
```bash
sudo apt install dconf-editor
```
Run dconf-editor, go to org -> gnome -> desktop -> interface -> cursor-size -> Set to 10
To configure scaling, open Screen Display and select 200% scale.

If you want to enable "Dash to panel" GNOME extension run
```bash
sudo apt install gnome-tweak-tool gnome-shell-extension-dash-to-panel -y
sudo shutdown -r now
```

Run Tweaks
* Disable animations
* Extensions -> Enable Dash to panel

Run this if you want to install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh):
```bash
./install_oh_my_zsh.sh
```

Install Ansible:
```bash
ansible/install_ansible.sh
```

Then you need to configure the variables in `ansible/vars/config.yml`.
You might also want to change variables in `ansible/roles/main/defaults/main.yml`.
Then run
```bash
ansible/provision.sh
```

Open Settings. Then set up:
- Power -> Blank screen -> Never
- Privacy -> Screen Lock -> Automatic Screen Lock -> Off
- Privacy -> Screen Lock -> Lock Screen on Suspend -> Off
- Privacy -> Screen Lock -> Blank Screen Delay -> Never

You are done!
