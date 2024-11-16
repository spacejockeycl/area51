#!/usr/bin/env bash

echo "Uninstalling SBCL"
sed '/Area51/,+1 d' $HOME/.zshrc > .zshrc.tmp && mv .zshrc.tmp $HOME/.zshrc
brew uninstall sbcl
brew uninstall readline
rm ~/.sbclrc

echo "Deleting Quicklisp"
rm -rf ~/.quicklisp