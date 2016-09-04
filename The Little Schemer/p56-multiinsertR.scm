(load "p16-lat.scm")

; 找到所有lat中old，并将new放到找到的old的右边
(define multiinsertR
    (lambda (new old lat)
        (cond ((null? lat) nil)
              ((eq? (car lat) old)
                (cons (car lat)
                      (cons new
                            (multiinsertR new old (cdr lat)))))
              (else
                (cons (car lat)
                      (multiinsertR new old (cdr lat)))))))


;Testing
(newline)
(define test '(coffee cup tea cup and hick cup))
(display (multiinsertR 'bacon 'cup test))
