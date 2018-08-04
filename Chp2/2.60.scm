#lang sicp

; 实例，集合的表示

(define true #t)
(define false #f)
(define nil '())

; find x in set，与无重复的一样
(define (element-of-set? x set)
    (cond ((null? set) false)
          ((equal? x (car set)) true)
          (else
             (element-of-set? x (cdr set)))))

; add x to set,if x is not in set，无需判重
(define (adjoin-set x set)
        (cons x set))

; 与书中代码的一样
(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) nil)
          ((element-of-set? (car set1) set2)
          (cons (car set1)
                (intersection-set (cdr set1) set2)))
          (else
            (intersection-set (cdr set1) set2))))

; 直接使用append操作，无需去重
(define (union-set set1 set2)
    (append set1 set2))
