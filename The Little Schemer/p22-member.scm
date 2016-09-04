(load "p16-lat.scm")

(define member?
    (lambda (a lat)
        ((null? lat) false)
        (else (or (eq? (car lat) a)
                  (member? a (cdr lat))))))
