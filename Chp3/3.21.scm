#lang sicp

(#%require "queue.scm")

;(define q1 (make-queue))
;(insert-queue! q1 'a)
;(display q1)
;(insert-queue! q1 'b)
;(display q1)
;(delete-queue! q1)
;(display q1)
;(delete-queue! q1)
;(display q1)

(define (print-queue queue)
  (car queue))

;; 解释器打印((a b) b)实际上是把car和cdr部分都打印出来了，很容易造成误解
