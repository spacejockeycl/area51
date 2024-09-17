#!/usr/bin/env bash

set -euf

echo "Uninstalling SBCL"
brew uninstall sbcl
rm ~/.sbclrc

echo "Deleting Quicklisp"
rm -r ~/.quicklisp