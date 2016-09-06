(load "p59-add1-sub1.scm")

;; 去掉列表中的所有数字,其中number?是已经实现的primitive function
(define no-nums
    (lambda (lat)
        (cond ((null? lat) nil)
              ((number? (car lat)
                (no-nums (cdr lat)))
              (else
                (cons (car lat)
                      (no-nums (cdr lat))))))))

(define all-nums
    (lambda (lat)
        (cond ((null? lat) nil)
              ((number? (car lat)
                (cons (car lat)
                      (all-nums (cdr lat)))
              (else
                (all-nums (cdr lat))))))))
