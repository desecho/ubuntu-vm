#!/bin/bash

set -eou pipefail

PLUGINS="git docker docker-compose thefuck"

sudo apt install zsh curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i "s/plugins=(git)/plugins=($PLUGINS)/g" "$HOME/$INIT_FILE"

cat >> ansible/vars.yml <<- EOM

# DO NOT EDIT BELOW THIS LINE.
# Requirement for zsh.
shell: zsh
EOM
