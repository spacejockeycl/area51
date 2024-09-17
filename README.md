# Area51

Common Lisp is a wonderfully powerful and pragmatic language with a long and
rich history. I believe, for the new interested user, learning Emacs and Slime
is a premature optimization. If a new user wishes to learn Common Lisp it 
should the fewest actions to get from  nil to eval.

Area51's only aim is to provide that simplicity.

Area51 is an installation script that provides an new Common Lisp user 
with an implementation (SBCL), a package manager (Quicklisp) and an upgraded
read-eval-print loop (REPL).

## Installation (only Mac OS supported)

```sh
$ curl -L https://raw.githubusercontent.com/spacejockeycl/area51/main/install.sh | bash
```

After installation you can start the REPL by executing:

```sh
$ sbcl
```

The installation process will finish the first time you run `sbcl`. You can
confirm this by observing all the text scrolling by. When the installation
completes you will be provided the following prompt:

```lisp
CL-USER>
```

Type `.clear` to clear the screen. Enter `.help` to get a list of commands you 
can type in the REPL. The REPL also supports tab completion. Try this out by 
typing:

```lisp
CL-USER> (for<tab><tab>
```

Where `<tab>` is the tab key. You should be provided a list of three options:
`force-output`, `format` and `formatter`.
