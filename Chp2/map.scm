#lang sicp

(#%require "list-function.scm")

(define (map proc items)
    (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (scale-list items factor)
    (map (lambda (x) (* x factor))
          items))
