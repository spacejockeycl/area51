# Area51

Area51 is an installation script that provides an new Common Lisp user 
with an implementation (SBCL), a package manager (Quicklisp) and an upgraded read-eval-print loop (REPL).

Common Lisp is a wonderfully powerful and pragmatic language with a long and
rich history. I believe, for the new interested user, learning Emacs and Slime
is a premature optimization. If a new user wishes to learn Common Lisp **it 
should take the fewest actions to get from nil to eval**.

Area51's only aim is to provide that simplicity. How we do we measure whether
we have achieved our aim? By successfully completing [Practical Common Lisp](https://gigamonkeys.com/book/) without leaving the REPL.

> The REPL is a fork of [fstamour/cl-repl](https://github.com/fstamour/cl-repl), which is a fork of [koji-kojiro/cl-repl](https://github.com/koji-kojiro/cl-repl)

## Installation (only Mac OS currently supported)

```sh
curl -L https://raw.githubusercontent.com/spacejockeycl/area51/main/install.sh | bash
```

After installation add an alias in your shell's config. For example if your shell is ZSH:

```sh
$ echo 'alias area51="sbcl --no-inform"' >> ~/.zshrc
```

Don't forget to `source` the file after adding the alias.

Then asumming you have an `area51` alias. After installation you can start the REPL by executing:

```sh
$ area51
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

## Uninstall

```sh
curl -L https://raw.githubusercontent.com/spacejockeycl/area51/main/uninstall.sh | bash
```