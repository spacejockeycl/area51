#!/usr/bin/env bash

set -euf

function verify_macos {
  if [ "$(uname)" != "Darwin" ]; then
    echo "Only MacOS is currently suppored."
    exit 1
  fi
}

function verify_commands_installed {
  required_commands=("brew" "curl" "git")
  for cmd in "${required_commands[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
      echo "'${cmd}' is required to continue."
      exit 1
    fi
  done
}

function install_sbcl {
  if ! brew ls --versions "sbcl" &> /dev/null; then
    brew install sbcl
  fi
}

function update_quicklisp {
  sbcl \
    --noinform --noprint --no-sysinit --no-userinit --disable-debugger \
    --load "$HOME"/quicklisp/setup.lisp \
    --quit
}

function install_quicklisp {
  if [ ! -d "./tmp" ]; then
    mkdir ./tmp
  fi
  curl -o ./tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
  sbcl \
    --noinform --noprint --no-sysinit --no-userinit --disable-debugger \
    --load ./tmp/ql.lisp \
    --eval '(quicklisp-quickstart:install)' \
    --eval '(ql-util:without-prompting (ql:add-to-init-file))' \
    --quit
  rm -rf ./tmp

  echo "Installing Packages"
  REPL_DIR=~/common-lisp/area51
  git clone git@github.com:spacejockeycl/area51.git $REPL_DIR

  echo "Adding Initialization"
  echo "
;;; Added by the Area51 installation script
(ql:quickload :area51 :silent t)
(area51:start)" >> "$HOME"/.sbclrc
}

verify_macos
verify_commands_installed
brew update

echo "Installing Dependencies"
if ! brew ls --versions "readline" &> /dev/null; then
  brew install readline
fi

echo "Installing Common Lisp (SBCL)"
install_sbcl

if [ ! -d "$HOME/quicklisp" ]; then
  echo "Installing Package Manager (Quicklisp)"
  install_quicklisp
else
  echo "Updating Quicklisp"
  update_quicklisp
fi

echo "
Create an alias in your shell's config. For example, in ZSH:
echo 'alias area51=\"sbcl --no-inform\"' >> ~/.zshrc

============================================================
\"You unlock this door with the key of imagination. Beyond 
it is another dimension - a dimension of sound, a dimension
of sight, a dimension of mind. You're moving into a land 
of both shadow and substance, of things and ideas. You've 
just crossed over into the Twilight Zone.\"
    - Rod Serling

Type \".clear\" to clear the screen and \".help\" for help. 
============================================================
"
