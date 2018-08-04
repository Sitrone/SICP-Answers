#lang sicp

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;; MIT-Scheme中打印结果为死循环
;; a b c a b c a b c ...
;; 盒子模型如下


;         +-----------------------+
;         |                       |
;         v                       |
;z ----> [*]----> [*]----> [*]----+
;         |        |        |
;         v        v        v
;        'a       'b       'c
