#!/bin/bash

set -eou pipefail

SHELL_INIT_FILE="${HOME}/.zshrc"
PLUGINS="git docker docker-compose thefuck alias-finder systemd aliases vscode ansible screen terraform helm kubectl colored-man-pages npm man python command-not-found sudo zsh_reload gitfast node gitignore pip golang"
CUSTOM_PLUGINS="django doctl"

sudo apt install zsh curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i "s/plugins=(git)/plugins=($PLUGINS $CUSTOM_PLUGINS)/g" "$SHELL_INIT_FILE"

cat >> "$SHELL_INIT_FILE" <<- EOM
# Block unwanted alias from the git plugin
alias gp="echo command blocked"
EOM

# Required for proper ansible provisioning
cat >> ansible/vars.yml <<- EOM

# DO NOT EDIT BELOW THIS LINE.
# Requirement for zsh.
shell: zsh
EOM
