#lang sicp

(#%require "2.18.scm")

;; 理解for-each与map的区别
;; map对输入进行指定操作，产生所需要的输出
;; for-each对输入进行操作，不关心输出

;; 特殊形式 begin 可以确保多条表达式按顺序求值，它可以将多条表达式当作一条表达式来运行
;; 因此可以吧begin用在带条判断的if里面
(define (for-each proc items)
    (if (not (null? items))
        (begin
              (proc (car items))
              (for-each proc (cdr items)))))

;; Testing
(for-each (lambda (x) (newline) (display x))
      (list 1 2 3 4))

;;method 2
(define (for-each-2 proc items)
    (cond (not (null? items))
          (proc (car items))
          (for-each-2 proc (cdr items))))
