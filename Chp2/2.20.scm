#lang sicp

(#%require "2.18.scm")
(#%require "even-and-odd.scm")

; if后面返回要处理的谓词，调用了系统的filter函数
(define (same-parity first . others)
    (filter (if (even? first)
                 even?
                 odd?)
            (cons first others)))
