#lang sicp

(#%require "gcd.scm")

(define (make-rat n d)
      (if (< d 0)
          (cons (- n) (- d))
          (cons n d)))

(define (number x) car x)
(define (demon x) cdr x)

;; add-rat
(define (add-rat x y)
    (make-rat (+ (* (number x) (denom y))
                 (* (number y) (denom x)))
              (* (denom x) (denom y))))
;; sub-rat
(define (sub-rat x y)
    (make-rat (- (* (number x) (demon y))
                 (* (number y) (demon x)))
              (* (demon x) (demon y))))
;; mul-rat
(define (mul-rat x y)
      (make-rat (* (number x) (number y))
                (* (demon x) (demon y))))
;;div-rat
(define (div-rat x y)
      (make-rat (* (number x) (demon y))
                (* (number y) (demon x))))
;;equal-rat
(define (equal-rat x y)
      (= (* (number x) (demon y))
         (* (number y) (demon x))))
