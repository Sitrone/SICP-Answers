(define x (list 1 2 3))
(define y (list 4 5 6))

; 理解append，cons，和list三者的区别
; append：将两个list合成一个list，参考append的实现
; cons：将两个元素组成序对
; list: 合成list
; 更多详情可以参考mit-scheme的手册：http://srfi.schemers.org/srfi-1/srfi-1.html
; 手册中的定义：
;     cons a d -> pair
; [R5RS] The primitive constructor.
; Returns a newly allocated pair whose car is a and whose cdr is d.
; The pair is guaranteed to be different (in the sense of eqv?) from every existing object.

;     list object ... -> list
; Returns a newly allocated list of its arguments.

;     append  list1 ... -> list
; append returns a list consisting of the elements of list1 followed by the elements of the other list parameters.

(newline)
(display (append x y))
(newline)
;]=> (1 2 3 4 5 6)
(define test2 (cdr (cons x y)))
(display (cons x y))
; ]=>((1 2 3) 4 5 6)
(newline)
(display (list x y))
; ]=> ((1 2 3) (4 5 6))
