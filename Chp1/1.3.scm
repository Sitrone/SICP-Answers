#lang sicp
(define (square x) ( * x x))

(define (sum-square x y) (+ square(x) square(y)))

(define (bigger x y) ( if (> x y)
                            x
                            y))
(define (smaller x y) ( if(< x y)
                           x
                           y))

(define (bigger-sum-of-squares a b c)
        (sum-square (bigger a b)
                    (bigger (smaller a b) c)))
