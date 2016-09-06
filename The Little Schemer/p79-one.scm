(load "p59-add1-sub1.scm")

(define one?
    (lambda (n) (= n 1)))

(define rempick
    (lambda (n lat)
        (cond ((one? n) (cdr lat))
              (else
                (cons (car lat)
                      (rempick (sub1 n) (cdr lat)))))))
