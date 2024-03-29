#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

ANSIBLE_VERSION=6.6.0

# It's required to also install these packages for ansible installation (cryptography dependencies)
sudo apt install python3-pip libffi-dev g++ libssl-dev -y

# Additional requirements
sudo apt install -y python3-apt aptitude

LC_ALL=C

# Install ansible
sudo pip3 install ansible=="${ANSIBLE_VERSION}"
