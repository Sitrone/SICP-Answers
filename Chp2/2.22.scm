(load "map.scm")
(load "2.18.scm")

;; 方法一实现的方式其实和2.18习题中实现reverse的方式是一样的
(define (square-list-1 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons (square (car things))
                        answer))))
    (iter items '()))
;; 修改方法，加上reverse方法
(define (square-list-11 items)
    (define (iter things answer)
        (if (null? things)
            (reverse answer)
            (iter (cdr things)
                  (cons (square (car things))
                        answer))))
    (iter items '()))

;; 实现出来的是序对，而不是list
;; 以 (list 1 2 3)为例
;; list其实是 (cons 1 (cons 2 (cons 3 nil)))
;; 而本题生成的是 (cons (cons (cons nil 3) 2) 1)
;; 要注意两者的区别
(define (square-list-2 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons answer
                        (square (car things))))))
      (iter items '()))

;; 修改方法，同2.18，将cons改为append，即可构造出来list
;; 不过使用append效率不会太高，因为应用append会对list再次进行遍历
(define (square-list items)
  (define (iter things answer)
      (if (null? things)
          (reverse answer)
          (iter (cdr things)
                (append (list (square (car things)))
                        answer))))
    (iter items '()))
