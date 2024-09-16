#!/usr/bin/env bash

set -euf -o pipefail

if ! command -v "brew" &> /dev/null
then
  echo "'brew' is required to continue."
  exit 1
fi

brew update

echo "Installing SBCL"
if ! brew ls --versions "sbcl" &> /dev/null
then
  brew install sbcl
fi

if ! brew ls --versions "readline" &> /dev/null
then
  brew install readline
fi

echo "Installing Quicklisp (global package manager)"
if [ ! -d "./tmp" ]
then
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

TMP_DIR=./tmp/a51repl
echo "Installing area51-repl and magic-ed"
git clone https://github.com/spacejockeycl/area51-repl.git ${TMP_DIR}
rm -rf ${TMP_DIR}/.git
mv ${TMP_DIR} ~/.quicklisp/local-projects
rm -rf ./tmp

echo ";;; Added by the Area51 installation script
(ql:quickload :cl-repl)
(ql:quickload :magic-ed)
(cl-repl:main)
" >> ~/.sbclrc
