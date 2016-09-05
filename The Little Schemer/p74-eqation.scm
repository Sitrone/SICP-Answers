(load "p59-add1-sub1.scm")
(load "p72-great.scm")
(load "p73-less.scm")

(define =
    (lambda (n m)
        (cond ((> n m) #f)
              ((< n m) #f)
              (else #t))))
