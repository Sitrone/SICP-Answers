(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (plus a b)
        (if (= a 0)
          b
          (inc (plus (dec a) b))))
;;递归调用


;;(define (plus a b)
;;      (if (= a 0)
;;          b
;;          (plus (dec a) (inc b))))

;;迭代调用
