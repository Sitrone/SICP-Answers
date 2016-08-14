; (1 3 (5 7) 9)
(define test1 (list 1 3 (list 5 7) 9))
; 或者可以定义为
(define or-test1 '(1 3 (5 7) 9))
(define x (car (cdr (car (cdr (cdr test1))))))

; ((7))
(define test2 (list (list 7)))
; 或者可以定义为
(define or-test2 '((7)))
(define y (car (car test2)))

; (1 (2 (3 (4 (5 (6 7))))))
; 注意第一次cdr拿出来的数据是((2 (3 (4 (5 (6 7))))))
; 所以进行下一步操作的时候需要再次car拿到没有嵌套的list，参考2.24的盒子模型
(define test3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(define or-test3 '(1 (2 (3 (4 (5 (6 7)))))))
;(define z (car (cdr (cdr (cdr (cdr (cdr (cdr test3)))))))) 此种写法有问题，参照2.24的盒子模型
(difine z (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr test3)))))))))))))
