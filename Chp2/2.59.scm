#lang sicp

(#%require "p103.scm")

(define (union-set set1 set2)
    (cond ((and (null? set1) (null? set2)) nil)
          ((null? set2) set1)
          ((null? set1) set2)
          ((element-of-set? (car set1) set2)
            (union-set (cdr set1) set2))
          (else (cons (car set1)
                    (union-set (cdr set1) set2)))))

;(define (union-set-filter set1 set2)
;    (append set1 (filter lambda (x)
;                          (not (element-of-set? x set1))
;                          set2)))
