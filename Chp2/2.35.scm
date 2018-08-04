#lang sicp

(#%require "p76.scm")

; 后面要生成一个树的子序列，参考前面p75 count-leaves的实现
(define (count-leaves tree)
      (accumulate + 0 (map (lambda (sub-tree)
                                   (if (pair? sub-tree)
                                       (count-leaves sub-tree)
                                       1))
                            tree)))
; Testing
(display (count-leaves '(1 (2 (3 4)))))


; method 2, 使用2.28的fringe函数，再结合习题2.33
(#%require "2.28.scm")
(define (count-leaves-2 tree)
    (accumulate (lambda (current-leave remainder-leaves)
                        (+ 1 remainder-leaves))
                        0
                        (fringe tree)))
