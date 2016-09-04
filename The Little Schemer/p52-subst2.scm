(load "p16-lat.scm")

; 用new替换在lat中最先出现的o1或者o2
(define subst2
    (lambda (new o1 o2 lat)
        (cond ((null? lat) nil)
              ((or (eq? ((car lat) o1)) ((car lat) o2))
                (cons new (cdr lat)))
              (else
                (cons (car lat)
                      (subst2 new o1 o2 (cdr lat)))))))


;Testing
(newline)
(define test '(ice cream with fudge for dessert))
(display (subst2 'topping 'fudge 'ice test))
