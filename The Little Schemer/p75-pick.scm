(load "p59-add1-sub1.scm")

;; 获得第n个数
(define pick
    (lambda (n lat)
        (cond ((zero? (sub1 n)) (car lat))
              (else
                (pick (sub1 n) (cdr lat))))))
;; 去掉第n个数
(define rempick
    (lambda (n lat)
        (cond ((zero? (sub1 n) (cdr lat))
              (else
                (cons (car lat)
                      (pick (sub1 n) (cdr lat))))))))
