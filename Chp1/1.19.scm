#lang sicp
;;Tpq a = bq + a(p + q)
;;    b = bp + aq
;; 两次Tpq变换
;; a = (bp + aq)p + (bq + a(p + q))(p + q) = b(2pa + q^2) + a(p^2 + q^2 + 2pq + q^2)
;; b = (bp + aq) + (bq + a(p + q))q = b(p^2 + q^2) + a(2pq + q^2)

(#%require "even-and-odd.scm")
(define (square n) (* n n))

(define (fib n)
          (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q n)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (square p) (square q))
                     (+ (* 2 p q) (square q))
                     (/ count 2)))
            (else (fib-iter (+ (* b q) (* a q) (* a p))
                            (+ (* b p) (* a q))
                            p
                            q
                            (- count 1)))))
