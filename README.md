# area51
Brand new Common Lisp user setup

* Start with Mac OS
* Installation of the following packages: SBCL, Quicklisp, Qlot, linedit
* Add quicklisp and linedit to .sbclrc
* Something to create project directory, use qlot inside that directory, write first file (maybe cl-project or quick-project)
* Something to run repl in project directory and loading systems for that project (including refresh)

```sh
$ curl -o- https://area51.build/install.sh | bash
```

## SBCL
```sh
$ brew install sbcl
```
Error is no homebrew

## Quicklisp
```sh
$ curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
$ sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
       --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
       --eval '(ql:add-to-init-file)' \
       --quit
```

## Qlot
```sh
$ curl -L https://qlot.tech/installer | sh
```

