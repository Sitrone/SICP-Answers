(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (average x y)
          (/ (+ x y) 2))

(define (improve guess x)
          (average guess (/ x guess)))

(define (sqart-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqart-iter (improve guess x)
                      x)))
(define (sqart x)
          ( sqart-iter 1.0 x))
