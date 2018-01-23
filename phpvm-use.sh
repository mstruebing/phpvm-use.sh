#!/usr/bin/env bash

set -e

PHP_VM_DIR="$HOME/.phpvm"
SYMLINK_DIR="$HOME/bin"

function printHelp {
    echo "phpvm-use php-version"
    echo "eg: phpvm-use 7.1.13"
}

# if amount of parameter not equals 1
if [ "$#" -ne 1 ]; then
    echo "ERROR: Only one parameter is allowed" 1>&2
    printHelp
    exit 1
fi

PHP_VERSION="$1"

# check if the wanted php version exists
if [ ! -d "$PHP_VM_DIR/installs/$PHP_VERSION" ]; then 
    echo "ERROR: PHP Version $PHP_VERSION doesn't exist" 1>&2
    echo "please run 'phpvm install $PHP_VERSION' first" 1>&2
    # TODO: add auto install
    exit 1
fi

# symlink binaries into ~/bin
# TODO: check if ~/bin is in path and alert user if not
#       maybe per environment variable
ln -sf "$PHP_VM_DIR/installs/$PHP_VERSION/bin/php" "$SYMLINK_DIR/php"
ln -sf "$PHP_VM_DIR/installs/$PHP_VERSION/bin/composer" "$SYMLINK_DIR/composer"
