
(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

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
