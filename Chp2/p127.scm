#lang sicp

(define (make-from-real-imag x y)
    (define (dispatch op)
      (cond ((eq? op 'real-part) x)
            ((eq? op 'imag-part) y)
            ((eq? op 'magnitude)
              (sqart (+ (square x) (square y))))
            ((eq? op 'angle)
              (actan y x))
            (else
              (error "Unkonwn op -- MAKE-FROM-REAL-IMAG" op))))
    dispatch)
