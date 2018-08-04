#lang sicp

(#%require "2.7.scm")

;(define (sub-interval a b)
;      (let ((p1 (min (lower-bound a) (lower-bound b)))
;            (p2 (max (lower-bound a) (lower-bound b)))
;            (p3 (min (upper-bound a) (upper-bound b)))
;            (p4 (max (upper-bound a) (upper-bound b))))
;         (make-interval (- p2 p1)
;                        (- p4 p3))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
