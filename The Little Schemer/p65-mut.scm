(load "p59-add1-sub1.scm")

(define *
    (lambda (n m)
        (cond ((zero? m) 0)
              (else
                (+ n (* n (sub1 m)))))))
