#lang sicp
;; recursive
(define (pascal r c)
        (cond ((> c r) (error "error"))
              ((or (= c 0) (= r c)) 1)
              (else (+ (pascal (- r 1) (- c 1))
                        (pascal (- r 1) c)))))

;; iterable
;;(x + y)^n 二项式定理
(#%require "chp1\\factorial.scm")
(define (pascal r c)
        (/ (factorial r)
          (* (factorial c)
              (factorial (- r c)))))

;; 树形展开的条件下面，所求参数越大，二者的求取速度差异越大
