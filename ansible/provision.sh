#!/bin/bash

set -eu

cd $(dirname "$0")

ansible-playbook main.yml --connection local --inventory inventory
