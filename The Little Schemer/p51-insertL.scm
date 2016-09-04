(load "p16-lat.scm")

(define insertL
    (lambda (new old lat)
        (cond ((null? lat) nil)
              ((eq? old (car lat))
                  (cons new lat))
              (else
                  (cons (car lat)
                        (insertL new old (cdr lat)))))))

; Testing
(define test '(ice cream with fudge for dessert))
(newline)
(display (insertL 'topping 'fudge test))
