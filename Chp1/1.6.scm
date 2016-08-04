(load "chap1\\1.5.scm")

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

(define (sqart-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (sqart-iter (improve guess x)
                        x)))

;;
