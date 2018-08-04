#lang sicp
; ;;Recursive
(define (f n)
        (if (< n 3)
          n
          (+ (f (- n 1))
                (* 2 (f (- n 2)))
                (* 3 (f (- n 3))))))



;iterative
(define (f n)
      (f-iter 2 1 0 n))
(define (f-iter a b c count)
      (cond ((= count 0) c)
            ((= count 1) b)
            ((= count 2) a)
            ((> count 2)
                (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
