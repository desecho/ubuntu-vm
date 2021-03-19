#!/bin/bash

set -eu

PLUGINS="git docker docker-compose"

sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i "s/plugins=(git)/plugins=($PLUGINS)/g" ~/.zshrc
