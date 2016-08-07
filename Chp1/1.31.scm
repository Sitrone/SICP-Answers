;; 递归版
(define (product term a next b)
        (if (> a b)
            1
            (* (term a)
                (product term (next a) next b))))
(define (inc x) (+ x 1))
(define (identity x) x)
(define (factorial n)
      (product identity 1 inc n))

;; 迭代版
(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
              result
              (iter (next a) (* result (term a)))))
        (iter a 1)

;; 计算pi
;; pi = 4 * (2 * 4* 4* 6* 6 *8...)/(3 * 3* 5* 5...)
(define (pi-product n)
   (define (term x)
      (/ (* 4.0 (square x))
         (- (* 4.0 (square x)) 1)))
   (* 2.0 (product term 1 inc n)))
