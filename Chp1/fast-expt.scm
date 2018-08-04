#lang sicp
(define (even? n)
        (= (remainder n 2) 0))
(define (fast-expt b n)
        (cond ((= n 0) 1)
            ((even? n) (square (fast-expt b (/ n 2))))
            (else (* b (square (fast-expt b (/ (- n 1) 2)))))))
            
;; 反复平方法，时间复杂度O(logn)
