#lang sicp

(#%require "p105.scm")

(define (adjoin-set x set)
  (cond ((or (null? set) (< x (car set)))
            (cons x set))
        ((= x (car set))
            set)
        (else
            (cons (car set) (adjoin-set x (cdr set))))))

; Testing
(newline)
(display (adjoin-set 3 '(1 2 4)))
(newline)
