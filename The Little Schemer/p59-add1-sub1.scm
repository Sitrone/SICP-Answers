(define add1
    (lambda (n)
        (+ n 1)))

(define sub1
    (lambda (n)
        (- n 1)))

(define zero?
    (lambda (n)
      (if (eq? n 0)
          #t
          #f)))
