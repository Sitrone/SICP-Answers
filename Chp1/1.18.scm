#lang sicp
(#%require "1.17.scm")

(define (muti a b)
        (muti-expt a b 0))
(define (muti-expt a b product)
          (cond ((= b 0) product)
                ((even? b)
                    (muti-expt (double a) (halve b) product))
                ((odd? b)
                    (muti-expt a (- b 1) (+ product a)))))

;; product 为这个迭代中的不变量，用它在状态之间来保持不变
