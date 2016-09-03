(load "p123-rectangular.scm")
(load "p124-polar.scm")

;; 定义过程attach-tag和contents
(define (attach-tag type-tag contents)
    (cons type-tag contents))
(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (error "wrong -- TYPE TAG" datum)))
(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "wrong -- CONTENTS" datum)))

(define (apply-generic op . arg)
    (let ((type-tags (map type-tag args)))
      (let ((proc (get op type-tags)))
        (if proc
            (apply proc (map contents args))
            (error
              "No method for these types -- APPLY-GENERIC"
              (list op type-tags))))))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

(define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y))
(define (make-from-mag-ang r a)
    ((get 'make-from-mag-ang 'polar) r a))
