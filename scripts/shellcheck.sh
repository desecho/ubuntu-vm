#!/bin/bash

set -eou pipefail

result=$(find . -name '*.sh' -exec shellcheck {} \;)
if [[ $result ]]; then
    echo "$result"
    exit 1
fi
