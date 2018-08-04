#lang sicp

(#%require "p129.scm")

;; 先添加通用操作
(define (equ? x y)
    (apply-generic 'equ? x y))

;; scheme 数值包
(define (install-scheme-number-package)
    (define (tag x)
        (attach-tag 'scheme-number x))
    (put 'add '(scheme-number scheme-number)
        (lambda (x y) (tag (+ x y))))
    (put 'sub '(scheme-number scheme-number)
        (lambda (x y) (tag (- x y))))
    (put 'mul '(scheme-number scheme-number)
        (lambda (x y) (tag (* x y))))
    (put 'div '(scheme-number scheme-number)
        (lambda (x y) (tag (/ x y))))
    (put 'make 'scheme-number
        (lambda (x) (tag x)))

    ;; newly added
    (put 'equ? 'scheme-number
        (lambda (x y) (= x y)))
'done)

;; rational 数值包
(define (install-rational-package)
    ;; interal procedures
    (define (number x) car x)
    (define (demon x) cdr x)
    (define (make-rat n d)
        (let ((g (gcd n d)))
          (cons (/ n g) (/ d g))))

    ;; add-rat
    (define (add-rat x y)
        (make-rat (+ (* (number x) (denom y))
                     (* (number y) (denom x)))
                  (* (denom x) (denom y))))
    ;; sub-rat
    (define (sub-rat x y)
        (make-rat (- (* (number x) (demon y))
                     (* (number y) (demon x)))
                  (* (demon x) (demon y))))
    ;; mul-rat
    (define (mul-rat x y)
          (make-rat (* (number x) (number y))
                    (* (demon x) (demon y))))
    ;;div-rat
    (define (div-rat x y)
          (make-rat (* (number x) (demon y))
                    (* (number y) (demon x))))

    ;; interface to the rest of the system
    (define (tag x) (attach-tag 'rational x))
    (put 'add '(rational rational)
        (lambda (x y) (tag (add-rat x y))))
    (put 'sub '(rational rational)
        (lambda (x y) (tag (sub-rat x y))))
    (put 'mul '(rational rational)
        (lambda (x y) (tag (mul-rat x y))))
    (put 'div '(rational rational)
        (lambda (x y) (tag (div-rat x y))))
    (put 'make 'rational
        (lambda (n d) (tag (make-rat n d))))

    ;; newly added
    (put 'equ? 'rational
        (lambda (x y) (and (= (number x) (number y))
                           (= (demon x) (demon y)))))
'done)

;; complex 数值包
(define (install-complex-package)
;; imported procedures from rectangular and ploar packages
    (define (make-from-real-imag x y)
        ((get 'make-from-real-imag 'rectangular) x y))
    (define (make-from-mag-ang r a)
        ((get 'make-from-mag-ang 'polar) r a))

    ;; interal interface
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

    ;; interface to the rest of the system
    (define (tag z) (attach-tag 'complex z))
    (put 'add '(complex complex)
        (lambda (z1 z2) (tag (add-complex z1 z2))))
    (put 'sub '(complex complex)
        (lambda (z1 z2) (tag (sub-complex z1 z2))))
    (put 'mul '(complex complex)
        (lambda (z1 z2) (tag (mul-complex z1 z2))))
    (put 'div '(complex complex)
        (lambda (z1 z2) (tag (div-complex z1 z2))))
    (put 'make-from-real-imag 'complex
        (lambda (x y) (tag (make-from-real-imag x y))))
    (put 'make-from-mag-ang 'complex
        (lambda (r a) (tag (make-from-mag-ang r a))))

    ;; newly added
    (put '=zero? 'complex
        (lambda (x y) (and (= (real-part x) (real-part y))
                           (= (imag-part x) (imag-part y)))))
                           
    ;; equ? 的另一种实现，对比 magnitude 和 angle

    ; (put 'equ? '(complex complex)
    ;    (lambda (x y)
    ;        (and (= (magnitude x) (magnitude x))
    ;             (= (angle x) (angle y)))))
'done)
