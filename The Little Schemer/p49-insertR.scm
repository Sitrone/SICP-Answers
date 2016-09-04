(load "p16-lat.scm")

(define insertR
    (lambda (new old lat)
          (cond ((null? lat) nil)
                ((eq? old (car lat))
                    (cons new (cdr lat)))
                (else
                  (cons (car lat)
                        (insertR new old (cdr lat)))))))
