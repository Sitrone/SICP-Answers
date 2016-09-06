(load "p59-add1-sub1.scm")

;; 计算列表中元素出现的次数
(define occur
    (lambda (a lat)
        (cond ((null? lat) 0)
              ((eq? a (car lat))
                (add1 (occur a (cdr lat))))
              (else
                (occur a (cdr lat))))))
