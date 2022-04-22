#!/bin/bash

set -eou pipefail

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

SHELL_INIT_FILE="${HOME}/.zshrc"
PLUGINS="git docker docker-compose thefuck alias-finder systemd aliases vscode ansible screen terraform helm kubectl colored-man-pages npm man python command-not-found sudo gitfast node gitignore pip golang zsh-autosuggestions zsh-syntax-highlighting"
CUSTOM_PLUGINS="doctl"

sed -i "s/plugins=(git)/plugins=($PLUGINS $CUSTOM_PLUGINS)/g" "$SHELL_INIT_FILE"

cat >> "$SHELL_INIT_FILE" <<- EOM
# Block unwanted alias from the git plugin
alias gp="echo command blocked"

# Enable [Shift + Tab] for zsh-autosuggestions
bindkey '^[[Z' end-of-line

EOM
