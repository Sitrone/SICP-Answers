#lang sicp

(define rand
  (let ((x random-init))
  (define (dispatch m)
    (cond ((eq? m 'generate)
            (begin (set! x (rand-update x))
              x))
          ((eq? m 'reset)
            (lambda (new-value) (set! x new-value)))
          (else
            error "Unkonwn request -- RAND")))
  dispatch))


; Testing
(define random-init 0)
(define (rand-update x) (+ x 1))
(display (rand 'generate))
