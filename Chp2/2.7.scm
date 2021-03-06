#lang sicp

(define (make-interval a b)
      (cons a b))
(define (upper-bound z)
      (cdr z))
(define (lower-bound z)
      (car z))

(define (add-interval x y)
      (make-interval (+ (lower-bound x) (lower-bound y))
                     (+ (upper-bound x) (upper-bound y)))) 
