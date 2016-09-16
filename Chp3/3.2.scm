(define (make-monitored f)
  (define call-num 0)
  (define (dispatch input)
      (cond ((eq? input 'how-many-calls?)
              call-num)
            ((eq? input 'reset-count)
              (begin (set! call-num 0) call-num))
            (else
              (begin (set! call-num (+ 1 call-num))
                  (f input)))))
  dispatch)

;; Testing
(define s (make-monitored sqrt))
(newline)
(display (s 100))
(newline)
(display (s 'how-many-calls?))
