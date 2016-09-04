; #lang racket

(define true #t)
(define false #f)
(define nil (quote ()))

; atom? 的对象可以是任何 S-expression(short for symbolic expression)
(define (atom? x)
  (and (not (pair? x)) (not (null? x))))


; all atoms are S-expressions
