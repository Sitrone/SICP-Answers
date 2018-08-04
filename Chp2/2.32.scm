#lang sicp

(define nil '())

;同找零问题
(define (subsets s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
          (append rest (map (lambda (x)
                                (cons (car s) x))
                            rest)))))
