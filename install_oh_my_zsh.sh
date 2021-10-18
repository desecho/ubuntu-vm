#!/bin/bash

set -eou pipefail

SHELL_INIT_FILE="${HOME}/.zshrc"
PLUGINS="git docker docker-compose thefuck alias-finder systemd aliases vscode ansible screen terraform helm kubectl colored-man-pages npm man python command-not-found sudo gitfast node gitignore pip golang zsh-autosuggestions zsh-syntax-highlighting"
CUSTOM_PLUGINS="doctl"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

sudo apt install zsh curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i "s/plugins=(git)/plugins=($PLUGINS $CUSTOM_PLUGINS)/g" "$SHELL_INIT_FILE"

cat >> "$SHELL_INIT_FILE" <<- EOM
# Block unwanted alias from the git plugin
alias gp="echo command blocked"

# Enable [Shift + Tab] for zsh-autosuggestions
bindkey '^[[Z' end-of-line

EOM

# Required for proper ansible provisioning
cat >> ansible/vars.yml <<- EOM

# DO NOT EDIT BELOW THIS LINE.
# Requirement for zsh.
shell: zsh
EOM
