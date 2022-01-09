#!/bin/bash

set -eou pipefail

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

# Required for proper ansible provisioning
cat >> ansible/vars.yml <<- EOM

# DO NOT EDIT BELOW THIS LINE.
# Requirement for zsh.
shell: zsh
EOM
