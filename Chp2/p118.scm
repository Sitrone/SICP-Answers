#lang sicp

;; 复数的四则运算

(define (make-from-real-imag z) (real-part z) (imag-part z))
(define (make-from-mag-ang z) (magnitude z) (angle z))

(define (add-complex z1 z2)
    (make-from-real-imag (+ (real-part z1) (real-part z2))
                         (+ (imag-part z1) (imag-part z2))))
(define (sub-complex z1 z2)
    (make-from-real-imag (- (real-part z1) (real-part z2))
                         (- (imag-part z1) (imag-part z2))))
(define (mul-complex z1 z2)
    (make-from-real-imag (* (magnitude z1) (magnitude z2))
                         (+ (angle z1) (angle z2))))
(define (div-complex z1 z2)
    (make-from-real-imag (/ (magnitude z1) (magnitude z2))
                         (- (angle z1) (angle z2))))
