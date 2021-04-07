#!/bin/bash

set -eu

ANSIBLE_VERSION=3.1.0

# It's required to also install these packages for ansible installation (cryptography dependencies)
sudo apt install python3-pip libffi-dev g++ libssl-dev -y

# Additional requirements
sudo apt install -y python-apt aptitude

LC_ALL=C

# Install ansible
sudo pip3 install ansible==$ANSIBLE_VERSION
