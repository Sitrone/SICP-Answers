#lang sicp

;; 3为正常的结果
;; (define test1 (cons a (cons b (cons '()))))

;; 无返回值可以是无线循环用3.13中的cycle
;; (define test2 (make-cycle (cons a (cons b (cons c '())))))

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
(define b (cons 'b '()))
(define test4 (cons 'a (cons b b)))
(display (count-pairs test4))

;
; four-pairs--->[*][*]--->[*][*]
;                |         |  |
;                v         v  v
;               [a]       [*][/]
;                          |
;                          v
;                         [b]
;

(define a (cons 'a 'a))
(define a-a (cons a a))
(define a-a-a (cons a-a a-a))
(newline)
(display (count-pairs a-a-a))
;
;       a-a-a--->[*][*]
;                 |  |
;                 v  v
;                [*][*]
;                 |  |
;                 v  v
;                [*][*]
;                 |  |
;              +--+  |
;              |     |
;              v     |
;             [a]<---+
;
