#lang sicp

(define (append x y)
  (if (null? x)
      y
      (cons (car x)
            (append (cdr x) y))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

;; Testing
(define x (list 'a 'b))
(define y (list 'c 'd))

    (newline)
    (display z)
    (newline)
    (display (cdr x))
(define z (append x y))
(define w (append! x y))
    (newline)
    (display w)
    (newline)
    (display (cdr x))


;; b
;; b c d

;; 因为第二个操作把x末尾的指针指向了y
;; 第一个姿势
  w------+
         |
         |
         v
  x --> [*]----> [*]----+
         |        |     |
         v        v     |
         'a       'b    |
                        |
         +--------------+
         |
         v
  y --> [*]----> [*]----> '()
         |        |
         v        v
         'c       'd


                x  -> [*]----> [*]----+
       |              |        |     |
       |              v        v     |
       |              a       'b     |
z-----[*]-------[*]                  |
                 |     +--------------+
                 |     |
                 |     v
                y --> [*]----> [*]----> '()
                       |        |
                       v        v
                      'c       'd
