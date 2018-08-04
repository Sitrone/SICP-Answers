#lang sicp

;[The difference between eq?, eqv?, equal?, and = in Scheme?]
;(http://stackoverflow.com/questions/16299246/what-is-the-difference-between-eq-eqv-equal-and-in-scheme)

; eqv? is a superset of eq? and for most cases you should use eqv? instead of eq?
; 1. Use the = predicate when you wish to test whether two numbers are equivalent.
; 2. Use the eqv? predicate when you wish to test whether two non-numeric values are equivalent.
; 3. Use the equal? predicate when you wish to test whether two lists, vectors, etc. are equivalent.
; 4. Don't use the eq? predicate unless you know exactly what you're doing.

(define (equal? a b)
        (if (and (pair? a) (pair? b))
            (and (equal? (car a) (car b))
                  (equal? (cdr a) (cdr b)))
            (eqv? a b)))

; Testing
(newline)
(display "False")
(newline)
(display (equal? '(this is a list) '(this (is a ) list)))
