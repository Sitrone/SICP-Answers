(load "p16-lat.scm")

; 用new替换lat中的old，如果lat中old存在
(define subst
    (lambda (new old lat)
        (cond ((null? lat) nil)
              ((eq? old (car lat)
                  (cons new (cdr lat)))
              (else
                (cons (car lat)
                      (subst new old (cdr lat))))))))

;Testing
(define test '(ice cream with fudge for dessert))
(newline)
(display (subst 'topping 'fudge test))
