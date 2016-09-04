(load "p16-lat.scm")

(define first
    (lambda (l)
        (cond ((null? l) nil)
              (else
                  (cons (car (car l))
                        (first (cdr l)))))))

; Testing
(define test (quote ((a b) (c d) (e f))))
(newline)
(display (first test))
