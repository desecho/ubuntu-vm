#!/bin/bash

set -eou pipefail

cd "$(dirname "$0")"

ansible-playbook main.yml --connection local --inventory inventory
