#!/bin/bash

set -eu

cd $(dirname "$0")

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
sudo install -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install apt-transport-https
sudo apt update
sudo apt install code -y

# Configure settings
cp settings.json ~/.config/Code/User/settings.json

# Install extensions
code --install-extension ms-python.python
code --install-extension ms-azuretools.vscode-docker
code --install-extension golang.go
code --install-extension editorconfig.editorconfig
code --install-extension cameron.vscode-pytest
code --install-extension waderyan.gitblame
code --install-extension mohsen1.prettify-json
code --install-extension lextudio.restructuredtext
