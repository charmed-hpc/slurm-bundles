#!/bin/bash
set -eu

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

OLD_VERSION="$1"
NEW_VERSION="$2"

sed -i -e "s/^__version__ = "'".*"'"\$/__version__ = "'"'"$NEW_VERSION"'"'"/" VERSION
# TODO # sed -i -e "s/\(Change Date:\s*\)[-0-9]\+\$/\\1$(date +'%Y-%m-%d' -d '3 years')/" LICENSE

echo "New version: $NEW_VERSION"
