(load "p59-add1-sub1.scm")

(define +
    (lambda (n m)
        (cond ((zero? m) n)
              (else
                (add1 (+ n (sub1 m)))))))
(define -
    (lambda (n m)
        (cond ((zero? m) n)
              (else
                (sub1 (- n (sub1 m)))))))
