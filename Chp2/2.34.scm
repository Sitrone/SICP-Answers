; Horner规则
(load "p76.scm")

(define (horner-eval x coefficient-sequence)
    (accumulate (lambda (this-coff higher-terms)
                        (+ this-coff (* x higher-terms)))
                        0
                        coefficient-sequence))


; Testing
(display (horner-eval 2 (list 1 3 0 5 0 1)))
