#lang sicp

(#%require "gcd.scm")
(#%require "p129.scm")

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
'done)
