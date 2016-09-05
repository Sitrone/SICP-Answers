(load "p16-lat.scm")


(define multisubst
      (lambda (new old lat)
          (cond ((null? lat) nil)
                ((eq? (car lat) old)
                  (cons new (multisubst new old (cdr lat))))
                (else
                  (cons (car lat)
                        (multisubst new old (cdr lat)))))))

; Testing
(newline)
(define test '(coffee cup tea cup and hick cup))
(display (multisubst 'bacon 'cup test))
