#lang sicp

(define (scale-tree tree factor)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (* tree factor))
          (else (cons (scale-tree (car tree) factor)
                      (scale-tree (cdr tree) factor)))))
; 将scale-tree看成子树的序列，并对他使用map操作
(define (scale-tree tree factor)
    (map (lambda (sub-tree)
            (if (pair? sub-tree))
            (scale-tree sub-tree factor)
            (* sub-tree factor))
          tree))
