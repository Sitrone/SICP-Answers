#lang sicp

(#%require "even-and-odd.scm")

(define (exp base n)
      (iter-exp base n 1))
(define (iter-exp base n count)
      (cond ((= n 0)
                      base)
            ((even? n)
                      (iter-exp (square base) (/ n 2) count))
            ((odd? n)
                      (iter-exp base (- n 1) (* count base)))))
(define (remain n divisor)
      (if (= (remainder n divisor) 0)
            (+ 1 (remain (/ n divisor) divisor))
            0))

(define (cons a b)
    (* (exp 2 a) (exp 3 b)))
(define (car z)
    (remain z 2))
(define (cdr z)
    (remain z 3))
