.DEFAULT_GOAL := help

include help.mk

#------------------------------------
# Installation
#------------------------------------

SHFMT_VERSION := 3.4.3
SHFMT_PATH := /usr/local/bin/shfmt

.PHONY: install-shfmt
## Install shfmt | Installation
install-shfmt:
	sudo curl https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_linux_amd64 -Lo ${SHFMT_PATH}
	sudo chmod +x ${SHFMT_PATH}

.PHONY: install-ansible
## Install Ansible
install-ansible:
	ansible/install_ansible.sh

## Install gnome-shell-extensions
install-gnome-shell-extensions:
	sudo apt install gnome-shell-extensions -y

## Install Oh My Zsh
install-oh-my-zsh:
	oh_my_zsh/install_oh_my_zsh_1.sh
	oh_my_zsh/install_oh_my_zsh_2.sh
#------------------------------------

#------------------------------------
# Commands
#------------------------------------

.PHONY: provision
## Provision | Commands
provision:
	ansible/provision.sh

.PHONY: lint
## Run linters
lint:
	shfmt -l -d .
	scripts/shellcheck.sh
	markdownlint README.md
	yamllint .github ansible
	scripts/jsonlint.sh lint

.PHONY: format
## Format files
format:
	shfmt -l -w .
	markdownlint README.md --fix
	scripts/jsonlint.sh format
#------------------------------------
