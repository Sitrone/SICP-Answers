(define true #t)
(define false #f)

(define (atom? x)
  (and (not (pair? x)) (not (null? x))))

(define lat?
    (lambda (l)
        (cond
            ((null? l) true)
            ((atom? (car l)) (lat? (cdr l)))
            (else
                false))))

; Testing
(define test '(bacon and eggs))
(display (lat? test))
