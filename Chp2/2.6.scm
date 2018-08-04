#lang sicp

; Church(丘奇计数)
; wiki:https://en.wikipedia.org/wiki/Church_encoding#Computation_with_Church_numerals
; ref: 1. https://pfmiles.wordpress.com/2009/11/12/%E9%80%90%E6%AD%A5%E7%90%86%E8%A7%A3%E4%B8%98%E5%A5%87%E6%95%B0%E4%B8%80/
;      2. http://community.schemewiki.org/?sicp-ex-2.6
(define zero
    (lambda (f) (lambda (x) x)))
(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))

; we can get one from (add-1 one)
; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
;; zero is a function of one arg, that returns a function of one arg that returns the argument (identity function)
;; ((zero f) x) is just x
; (lambda (f) (lambda (x) (f x)))

; so we can difine one
(define one
    (lambda (f) (lambda (x) (f x))))
; we can get two from (add-1 one)
; (add-1 one)
; (lambda (f) (lambda (x)  (f ((one f)) x)))
; => (lambda (f) (lambda (x) (f (((lambda (a) (lambda (b) (a b))) f) x))))
; => (lambda (f) (lambda (x) (f ((lambda (b) (f b)) x))))
; => (lambda (f) (lambda (x) (f (f x))))
; (lambda (f) (lambda (x) (f (f x))))

; we can define two
(define two
    (lambda (f) (lambda (x) (f (f x)))))

;; define add
(define (add a b)
    (lambda (f)
      (lambda (x)
        ((a f) ((b f) x)))))

; Testing
(define (inc n)
      (+ n 1))
(newline)
(display (((add one two) inc) 0))
(newline)

(define (int-to-church n)
  (define (iter i result)
    (if (= i n)
        result
        (iter (+ i 1) (add-1 result))))
  (iter 0 zero))
(newline)
(display (int-to-church 5))
