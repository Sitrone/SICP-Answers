#lang sicp

(#%require "2.8.scm")
; 区间不能横跨0，也即不能起点是负数，终点是正数
(define (span-zero? x)
      (and (>= (upper-bound x) 0)
           (<= (lower-bound x) 0)))
(define (div-interval x y)
    (if (span-zero? y)
                    (error "span zero.")
                    (make-interval (/ 1.0 (upper-bound y))
                          (/ 1.0 (lower-bound y)))))
