(define addup
    (lambda (tup)
        (cond ((null? tup) 0)
              (else (+ (car tup)
                       (addup (cdr tup)))))))
