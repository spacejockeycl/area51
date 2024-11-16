#!/usr/bin/env bash

set -euf

function verify_commands_installed {
  required_commands=("brew" "curl" "git")
  for cmd in "${required_commands[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
      echo "'${cmd}' is required to continue."
      exit 1
    fi
  done
}

function update_quicklisp {
  sbcl \
    --noinform --noprint --no-sysinit --no-userinit --disable-debugger \
    --load "$HOME/.quicklisp/setup.lisp" \
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
    --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
    --eval '(ql:add-to-init-file)' \
    --quit
  rm -rf ./tmp

  echo "Installing Packages"
  REPL_DIR=~/.quicklisp/local-projects/area51-repl
  git clone https://github.com/spacejockeycl/area51-repl.git $REPL_DIR

  echo "Adding Initialization"
  echo ";;; Added by the Area51 installation script
  (ql:quickload :area51-repl)
  (area51-repl:start)
  " >> ~/.sbclrc
}

brew update

echo "Installing Dependencies"
if ! brew ls --versions "readline" &> /dev/null; then
  brew install readline
fi

echo "Installing Common Lisp (SBCL)"
if ! brew ls --versions "sbcl" &> /dev/null; then
  brew install sbcl
fi

if [ ! -d "$HOME/.quicklisp" ]; then
  echo "Installing Package Manager (Quicklisp)"
  install_quicklisp
else
  echo "Updating Quicklisp"
  update_quicklisp
fi

echo "
=====================================================
Type \"sbcl\" to finish installation.
When installation completes, type \".help\" for help. 

Thank you and Happy Lisping!
=====================================================
"