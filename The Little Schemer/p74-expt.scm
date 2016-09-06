(load "p59-add1-sub1.scm")

;; 阶乘
(define expt
    (lambda (n m)
        (cond ((zero? m) 1)
              (else
                (* (expt n (sub1 m)))))))
