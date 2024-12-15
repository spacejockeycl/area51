(in-package :cl-user)

(defpackage :area51
  (:use :cl
    #:alexandria
    #:cl-ppcre
    #:cl-readline
    #:magic-ed
    #:uiop)
  (:export
    #:start))