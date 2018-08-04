#lang sicp

(define (make-from-mag-ang r a)
    (define (dispatch op)
    (cond ((eq? op 'real-part)
           (* r (cos a)))
          ((eq? op 'imag-part)
            (* r (sin a)))
          ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          (else
            (error "Unkonwn op -- MAKE-FROM-REAL-IMAG" op))))
  dispatch)

; Testing
(define test (make-from-mag-ang 3 4))
(newline)
(display (test 'real-part))
(newline)
