#!/bin/bash
# shellcheck disable=SC2086

set -eou pipefail

sudo apt install zsh curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
