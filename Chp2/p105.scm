#lang sicp

; 集合，作为排序的表

(define true #t)
(define false #f)
(define nil '())

(define (element-of-set? x set)
    (cond ((null? set) false)
          ((= x (car set)) true)
          ((< x (car set)) false)
          (else
            (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
    (if (or (null? set1) (null? set2))
        nil
        (let ((x1 (car set1)) (x2 (car set2)))
          (cond ((= x1 x2)
                 (cons x1
                       (intersection-set (cdr set1)
                                         (cdr set2))))
                ((< x1 x2)
                 (intersection-set? (cdr set1) set2))
                ((> x1 x2)
                 (intersection-set? set1 (cdr set2)))))))
