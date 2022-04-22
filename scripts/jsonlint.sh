#!/bin/bash

set -eou pipefail

jsonFiles=$(find vs_code -type f -name "*.json")

if [ "$1" == "lint" ]; then
    for file in $jsonFiles; do
        jsonlint "$file" -q
    done
fi

if [ "$1" == "format" ]; then
    for file in $jsonFiles; do
        jsonlint "$file" -i
        # shellcheck disable=SC1003
        sed -i -e '$a\' "$file"
    done
fi
