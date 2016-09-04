(load "p16-lat.scm")

; remove all a in lat
; 移除lat中所有的a
(define multirember
    (lambda (a lat)
        (cond ((null? lat) nil)
              ((eq? (car lat) a)
                (multirember a (cdr lat)))
              (else
                (cons (car lat)
                      (multirember (cdr lat)))))))

;Testing
(newline)
(define test '(coffee cup tea cup and hick cup))
(display (multirember 'cup test))
