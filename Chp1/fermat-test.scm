#lang sicp
(#%require "even-and-odd.scm")

(define (square n)
    (* n n))
;; 模n同余（如果两个数除以n的余数相同）
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
                    (remainder (square (expmod base (/ exp 2) m))
                      m))
          ((odd? exp)
                    (remainder (* base (expmod base (- exp 1) m))
                      m))))
;; 选取1 - (n-1)之间的数a，检查a的n次幂取模n的余数是否等于a
(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
      (try-it (+ 1 (random (- n 1)))))

;; 定义检测的次数
(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else fasle)))
