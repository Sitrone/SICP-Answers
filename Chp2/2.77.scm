;; magnitude, angle通用选择器
;; 原因是系统中不存在’complex类型的magnitude的操作
;; 需要增加通用型的操作

; (magnitude z)
; (apply-generic 'magnitude z)
; (map type-tag (list z))         ; => '(complex)
; (get 'magnitude '(complex))     ; => #f
; (error ...)


(load "p129.scm")


(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

;; 修复过的复数包
(define (install-complex-package)

    ;;; imported procedures from rectangular and polar packages
    (define (make-from-real-imag x y)
        ((get 'make-from-real-imag 'rectangular) x y))

    (define (make-from-mag-ang r a)
        ((get 'make-from-mag-ang 'polar) r a))

    ;;; interal procedures
    (define (add-complex z1 z2)
        (make-from-real-imag (+ (real-part z1) (real-part z2))
                             (+ (imag-part z1) (imag-part z2))))

    (define (sub-complex z1 z2)
        (make-from-real-imag (- (real-part z1) (real-part z2))
                             (- (imag-part z1) (imag-part z2))))

    (define (mul-complex z1 z2)
        (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                           (+ (angle z1) (angle z2))))

    (define (div-complex z1 z2)
        (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                           (- (angle z1) (angle z2))))

    ;;; interface to rest of the system
    (define (tag z)
        (attach-tag 'complex z))

    (put 'add '(complex complex)
        (lambda (z1 z2)
            (tag (add-complex z1 z2))))

    (put 'sub '(complex complex)
        (lambda (z1 z2)
            (tag (sub-complex z1 z2))))

    (put 'mul '(complex complex)
        (lambda (z1 z2)
            (tag (mul-complex z1 z2))))

    (put 'div '(complex complex)
        (lambda (z1 z2)
            (tag (div-complex z1 z2))))

    (put 'make-from-real-imag 'complex
        (lambda (x y)
            (tag (make-from-real-imag x y))))

    (put 'make-from-mag-ang 'complex
        (lambda (r a)
            (tag (make-from-mag-ang r a))))

    ; 新增
    (put 'real-part '(complex) real-part)

    (put 'imag-part '(complex) imag-part)

    (put 'magnitude '(complex) magnitude)

    (put 'angle '(complex) angle)

'done)

(define (make-complex-from-real-imag x y)
    ((get 'make-from-real-imag 'complex) x y))

(define (make-complex-from-mag-ang r a)
    ((get 'make-from-mag-ang 'complex) r a))

;; Testing
(install-rectangular-package)
(install-polar-package)
(install-complex-package)
(newline)
(display (magnitude (make-complex-from-real-imag 3 4)))

;; 完整的过程如下
; (magnitude z)
; (apply-generic 'magnitude z)
; (map type-tag (list z))                        ; => '(complex)
; (get 'magnitude '(complex))
; (applay magnitude (map contents (list z)))     ; =>  (apply magnitude '((rectangular 3 . 4)))
; (magnitude '(rectangular 3 4))
; (apply-generic 'magnitude '(rectangular 3 4))
; (map type-tag (list '(rectangular 3 4)))
; (get 'magnitude '(rectangular))
; (apply magnitude (map contents (list '(rectangular 3 . 4))))
; (magnitude '(3 . 4))
; (sqrt (+ (square (real-part '(3 . 4)))
;          (square (imag-part '(3 . 4)))))

; 5
