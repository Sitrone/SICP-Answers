#lang sicp

(#%require "2.8.scm")

(define (length x)
    (/ (- (upper-bound x) (lower-bound x)) 2))

(define (add-length1 x y)
    (length (add-interval x y)))
; ]=> (length (add-interval x y))
; ]=> (length (make-interval ((+ (lower-bound x) (lower-bound y))
;               (+ (upper-bound x) (upper-bound y)))))


(define (add-length2 x y)
    (+ (length x) (length y)))

(define (sub-length1 x y)
    (- (length x) (length y)))

(define (sub-length2 x y)
    (length (sub-interval x y)))

;; 加和减可以证明，乘和除可以用反证
