#lang sicp
(define (f g)
    (g 2))
(define (square x) (* x x))
(f square)
(f (lambda (z) (* z (+ z 1))))

;; (f f)
;(f f)
;=> (f 2)
;=> (2 2)
;; Error
;; MIT Scheme reports: The object 2 is not applicable.
;; 将函数f用lambda和define写出来
; (define f (lambda (g) (g 2)))
;; (f (lambda (g) (g 2)))
;; ((lambda (g) (g 2)) (lambda(g) (g 2)))
;; (2 2)
;; 2不是函数，解释器无法调用
