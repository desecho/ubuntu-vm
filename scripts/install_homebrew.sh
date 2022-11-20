#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
