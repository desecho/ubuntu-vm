#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

sudo apt install zsh curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
