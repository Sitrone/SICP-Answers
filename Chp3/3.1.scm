(define (make-accumulator sum)
  (lambda (num)
    (set! sum (+ num sum))
    sum))


(define A (make-accumulator 5))
(newline)
(display (A 10))
(newline)
(display (A 10))
