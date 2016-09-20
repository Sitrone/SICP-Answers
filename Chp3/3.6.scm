(define (rand)
  (define x random-init)
  (define (generate)
      (set! x (rand-update x))
      x)
  (define (reset new-value)
      (set! x new-value)
      x)
  (define (dispatch m)
    (cond ((eq? m 'generate)
            generate)
          ((eq? m 'reset)
            reset)
          (else
            error "Unkonwn request -- RAND")))
  dispatch)

; Testing
