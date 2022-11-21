.DEFAULT_GOAL := help

include makefiles/colors.mk
include makefiles/help.mk
include makefiles/macros.mk

#------------------------------------
# Helpers
#------------------------------------

.PHONY: pre-commit
.pre-commit:
	@pre-commit run --all-files

#------------------------------------
# Installation
#------------------------------------
BIN_DIR := /usr/local/bin

SHFMT_VERSION := 3.4.3
SHFMT_PATH    := $(BIN_DIR)/shfmt

.PHONY: install-shfmt
## Install shfmt | Installation
install-shfmt:
	$(call print,Installing shfmt)
	@sudo curl https://github.com/mvdan/sh/releases/download/v$(SHFMT_VERSION)/shfmt_v$(SHFMT_VERSION)_linux_amd64 -Lo $(SHFMT_PATH)
	@sudo chmod +x $(SHFMT_PATH)

SHELLCHECK_VERSION := 0.8.0
SHELLCHECK_PATH    := $(BIN_DIR)/shellcheck
SHELLCHECK_TMP_DIR := $(shell mktemp -d)
SHELLCHECK_ARCHIVE := shellcheck.tar.xz

.PHONY: install-shellcheck
## Install shellcheck
install-shellcheck:
	$(call print,Installing shellcheck)
	@cd $(SHELLCHECK_TMP_DIR) \
		&& curl https://github.com/koalaman/shellcheck/releases/download/v$(SHELLCHECK_VERSION)/shellcheck-v$(SHELLCHECK_VERSION).linux.x86_64.tar.xz -Lo $(SHELLCHECK_ARCHIVE) \
		&& tar -xf $(SHELLCHECK_ARCHIVE) \
		&& sudo cp shellcheck-v$(SHELLCHECK_VERSION)/shellcheck $(SHELLCHECK_PATH)

ACTIONLINT_VERSION := 1.6.13
ACTIONLINT_PATH    := $(BIN_DIR)/actionlint
ACTIONLINT_URL     := https://github.com/rhysd/actionlint/releases/download/v$(ACTIONLINT_VERSION)/actionlint_$(ACTIONLINT_VERSION)_linux_amd64.tar.gz
ACTIONLINT_TMP_DIR := $(shell mktemp -d)
ACTIONLINT_ARCHIVE := actionlint.tar.gz

.PHONY: install-actionlint
## Install actionlint
install-actionlint:
	$(call print,Installing actionlint)
	@cd $(ACTIONLINT_TMP_DIR) \
		&& curl $(ACTIONLINT_URL) -Lo $(ACTIONLINT_ARCHIVE) \
		&& tar -xvf $(ACTIONLINT_ARCHIVE) \
		&& sudo mv actionlint $(ACTIONLINT_PATH)

.PHONY: install-linters-binaries
## Install linters binaries | Installation
install-linters-binaries: install-shfmt install-actionlint install-shellcheck

.PHONY: install-ansible
## Install Ansible
install-ansible:
	$(call print,Installing Ansible)
	@ansible/install_ansible.sh

.PHONY: install-homebrew
## Install Homebrew
install-homebrew:
	$(call print,Installing Homebrew)
	@scripts/install_homebrew.sh

## Install gnome-shell-extensions
install-gnome-shell-extensions:
	$(call print,Installing gnome-shell-extensions)
	@sudo apt install gnome-shell-extensions -y

.PHONY: install-oh-my-zsh-1
## Install Oh My Zsh (1)
install-oh-my-zsh-1:
	$(call print,Installing Oh My Zsh Part 1)
	@oh_my_zsh/install_oh_my_zsh_1.sh

.PHONY: install-oh-my-zsh-2
## Install Oh My Zsh (2)
install-oh-my-zsh-2:
	$(call print,Installing Oh My Zsh Part 2)
	@oh_my_zsh/install_oh_my_zsh_2.sh

## Install VS Code
install-vs-code:
	$(call print,Installing VS Code)
	@vs_code/install_vs_code.sh

.PHONY: install-pre-commit
## Install pre-commit
install-pre-commit:
	$(call print,Installing pre-commit)
	@sudo pip3 install pre-commit

.PHONY: setup-pre-commit
## Set up pre-commit. Activate git hooks
set-up-pre-commit:
	$(call print,Setting up pre-commit)
	@pre-commit install
#------------------------------------

#------------------------------------
# Commands
#------------------------------------
.PHONY: provision
## Provision | Commands
provision:
	$(call print,Provisioning)
	@ansible/provision.sh

.PHONY: lint
## Run linters
lint: .pre-commit
	$(call print,Linting)
	@actionlint

.PHONY: format
## Format files
format: .pre-commit
	$(call print,Formatting files)
#------------------------------------
