(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '())))

;; 最后会翻转过来
(define w (mystery (list 'a 'b 'c)))
;; 执行前的盒子模型为
v --> [*]----> [*]----> [*]----> '()
       |        |        |
       v        v        v
       'a       'b       'c

;; 执行后的盒子模型为
v------------------------+
                         |
                         v
w --> [*]----> [*]----> [*]----> '()
       |        |        |
       v        v        v
       'c       'b       'a
