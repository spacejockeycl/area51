#!/usr/bin/env bash

echo "Uninstalling SBCL"
brew uninstall sbcl
brew uninstall readline
rm ~/.sbclrc

echo "Deleting Quicklisp"
rm -rf ~/.quicklisp