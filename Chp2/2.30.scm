(define nil '())

; method one
(define (square-tree tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (square tree))
          (else
              (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

; Testing
(square-tree
          (list 1
             (list 2 (list 3 4) 5)))

; method two
(define (square-tree-2 tree)
    (map (lambda (sub-tree)
            (if (pair? sub-tree)
                (square-tree-2 tree)
                (square sub-tree)))
            tree))

; 2.31是对上面两种模式的一个公共的抽象,
; 也即将square换成proc，任意方式都可以处理
