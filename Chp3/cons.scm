#lang sicp

(define (cons x y)
  (let ((new gen-new-pair))
    (set-car! new x)
    (set-cdr! new y)
  new))
