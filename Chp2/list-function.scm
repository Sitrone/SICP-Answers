#lang sicp

(define (length-recursive items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))

(define (length-iter items)
    (define (len-iter a count)
        (if (null? a)
            count)
            (len-iter (cdr a) (+ count 1)))
    (len-iter items 0))

(define (list-ref items n)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n 1))))

(define (append list1 list2)
      (if (null? list1)
          list2
          (cons (car list1) (append (cdr list1) list2))))
(define nil '())
