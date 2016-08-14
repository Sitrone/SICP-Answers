(load "2.18.scm")

;; 直观的想法是下面这样子的
(define (reverse-test l)
    (if (null? l)
        nil
        (cons (reverse-test (cdr l)) (car l))))
;; 测试一下，返回值成了序对
; ]=> (reverse-test (list 1 2 3))
; ]=> (((() . 3) . 2) . 1)

;; 改进一下，利用前面的append方法，重新生成list
(define (reverse items)
    (if (null? items)
        nil
        (append (reverse(cdr items))
            (list (car items)))))
;; 另外一种迭代的方法，参考community.schemewiki
(define (reverse-iter items)
    (define (it-iter lat ans)
        (if (null? lat)
            ans
            (it-iter (cdr ans) (cons (car lat) ans))))
    (it-iter items nil))
;;比如说，对于列表 (list 3 2 1) 来说， iter 先组合起 (cons 1 '()) ，
;;然后是 (cons 2 (cons 1 '())) ，最后是 (cons 3 (cons 2 (cons 1'())))
