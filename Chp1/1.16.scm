#lang sicp
(define (even? n)
        (= (remainder n 2) 0))
(define (odd? n)
        (= (remainder n 2) 1))
(define (fast-expt b n)
    (fast 1 b n))
(define (fast a b n)
        (cond ((= n 0)  a)
              ((even? n) (fast a (square b) (/ n 2)))
              ((odd? n) (fast (* b a) b (- n 1)))))

;; 定义不变量a来保持中间的状态不变
;; 这一技术是思考迭代算法设计的强有力的方法
;; 非常重要
;; 非常重要
;; 非常重要
