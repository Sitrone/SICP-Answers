(load "2.18.scm")

(define (deep-reverse x)
      (cond ((null? x) nil)
      (not (pair? x) x)
        (else
              (reverse (list (deep-reverse (car x))
                             (deep-reverse (cdr x)))))))

;Testing
(define test '((1 3) (2 4)))
(newline)
(display (deep-reverse test))
