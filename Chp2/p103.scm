#lang sicp

; 实例，集合的表示

(define true #t)
(define false #f)
(define nil '())

; find x in set
(define (element-of-set? x set)
    (cond ((null? set) false)
          ((equal? x (car set)) true)
          (else
             (element-of-set? x (cdr set)))))

; add x to set,if x is not in set
(define (adjoin-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)))

(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) nil)
          ((element-of-set? (car set1) set2)
          (cons (car set1)
                (intersection-set (cdr set1) set2)))
          (else
            (intersection-set (cdr set1) set2))))
