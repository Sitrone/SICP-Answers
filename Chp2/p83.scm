#lang sicp

(#%require "p76.scm")

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))

(define (prime-pair? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-pair?
            (flatmap
                (lambda (i)
                    (map (lambda (j) (list i j))
                         (enumerate-interval 1 (- i 1))))
                         (enumerate-interval 1 n)))))
