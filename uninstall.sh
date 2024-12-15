#!/usr/bin/env bash

echo "Removing local Area51 installation"
rm -rf ~/common-lisp/area51

echo "Deleting Quicklisp"
rm -rf ~/quicklisp

echo "Uninstalling SBCL"
brew uninstall sbcl
brew uninstall readline
rm ~/.sbclrc