(define (a-plus-abs-b a b)
          ((if (> b 0) + -) a b))

;; if b > 0, result= a + b
;; else b <= 0, result = a - b
