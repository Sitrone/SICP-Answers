;; Point
(define (make-point x y)
    (cons x y))

(define (x-point x)
    (car x))

(define (y-point x)
    (cdr x))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
    )

;; segment
(define (make-segment start-point end-point)
    (cons start-point end-point))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define (average x y)
        (/ (+ x y) 2.0))

(define (midpoint-segment segment)
    (let ((start (start-segment segment))
         (end (end-segment segment)))
         (make-point (average (x-point start)
                              (x-point end))
                     (average (y-point start)
                              (y-point end)))))
;;Testing
(define seg (make-segment (make-point 3 5)
                          (make-point 4 10)))
(print-point (midpoint-segment seg))
