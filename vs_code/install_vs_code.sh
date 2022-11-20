#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
cd "${DIR}"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/tmp/packages.microsoft.gpg
sudo install -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install apt-transport-https
sudo apt update
sudo apt install code -y

# Configure settings
CONFIG_PATH="$HOME/.config/Code/User/"
mkdir -p "$CONFIG_PATH"
cp configs/* "$CONFIG_PATH"

# Install extensions

# Python
code --install-extension ms-python.python
code --install-extension cameron.vscode-pytest
code --install-extension batisteo.vscode-django

# Go
code --install-extension golang.go

# TypeScript
code --install-extension Vue.volar
code --install-extension Vue.vscode-typescript-vue-plugin

# --------------------------------------------------------------------------------
# Syntax highlighting

# Dockerfile
code --install-extension ms-azuretools.vscode-docker

# rst
code --install-extension lextudio.restructuredtext

# tf
code --install-extension hashicorp.terraform

# sh
code --install-extension timonwong.shellcheck

# md
code --install-extension yzhang.markdown-all-in-one

# toml
code --install-extension bungcip.better-toml
# --------------------------------------------------------------------------------

# Misc
code --install-extension editorconfig.editorconfig
code --install-extension waderyan.gitblame
code --install-extension github.copilot
code --install-extension mohsen1.prettify-json
code --install-extension geddski.macros
# --------------------------------------------------------------------------------
