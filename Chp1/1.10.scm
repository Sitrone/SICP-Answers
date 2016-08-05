(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                      (A x (- y 1))))))

(A 1 10)
(A 0 (A 0 9))
...
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1))))))))))
;; value: 2^10

(A 2 4)
;; value: 2^32
...

(define (f n) (A 0 n))
;; 2 * n

(define (g n) (A 1 n))
;; 2^n

(define (h n) (A 2 n))
;; 连续n次2幂次
;; n	0	1	2	 3	  4	   5	 6	 7	...
;; v	0	2	4	16	65536	...	...	...	...
;; 超过4以后，就会超出scheme解释器的最大递归深度
