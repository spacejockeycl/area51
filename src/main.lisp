(in-package #:area51)

(defun version ()
  (asdf/component:component-version
   (asdf/find-system:find-system '#:area51)))

(defvar *versions*
  (format nil "area51 ~a on ~a ~a"
          (version)
          (lisp-implementation-type)
          (lisp-implementation-version)))

(defun setup-readline ()
  (cffi:load-foreign-library 'cl-readline:readline)
  (rl:register-function :redisplay #'redisplay-with-highlight)
  (rl:register-function :complete #'complete)
  (init-keymap))

(defun start ()
  (setup-readline)
  (unwind-protect
    (repl)
    (rl:deprep-terminal)))


