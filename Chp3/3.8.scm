#lang sicp

;; f在第一次调用的时候返回调用它的促使first-value，
;; 然后将 f 设置为一个无论接受什么参数都只返回 0 的过程，因此最终求值结果就由第一次调用 f 的参数决定了。
;; Ref: http://sicp.readthedocs.io/en/latest/chp3/8.html

(define f
    (lambda (first-value)
      (set! f (lambda (second-value) 0))
      first-value))

(define g
  (let ((s 1))
    (lambda (x)
      (if (= s 1)
           (begin (set! s x) s)
          s))))

; Testing
(define test
    (begin
      (newline)
      (display
        (+ (f 0) (f 1)))
      (newline)
      (display
        (+ (f 1) (f 0)))
    ))

;; MIT-Scheme 是从右到左求值
