(load "p59-add1-sub1.scm")

(define length
    (lambda (lat)
        (cond ((null? lat) nil)
              (else
                (add1 (length (cdr lat)))))))


;Testing
(newline)
(define test '(hotdogs with mustart and pickles))
(display (length test))
