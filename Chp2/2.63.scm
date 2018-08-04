#lang sicp

(#%require "p106.scm")

; 树的前序遍历，递归
(define (tree->list-1 tree)
    (if (null? tree)
        nil
        (append (tree->list-1 (left-branch tree))
                (cons (entry tree)
                      (tree->list-1 (right-branch tree))))))

; 树的前序遍历，尾递归
(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
        (if (null? tree)
            result-list
            (copy-to-list (left-branch tree)
                          (cons (entry tree)
                                (copy-to-list (right-branch tree)
                                              result-list)))))
    (copy-to-list tree nil))

; Testing
; p106页 tree one
;(define tree-1 (make-tree '(7 (3  (1 nil nil) (5 nil nil)) (9 nil (11 nil nil)))))
(define tree-1 (make-tree 7
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      (make-tree 5 '() '()))
                           (make-tree 9
                                      '()
                                      (make-tree 11 '() '()))))
(display tree-1)
(newline)
(display (tree->list-1 tree-1))
(newline)
(display (tree->list-2 tree-1))
(newline)

; tree two
;(define tree-2 (make-tree '(3 (1 nil nil) (7 (5 (9 nil (11 nil nil)))))))
(define tree-2 (make-tree 3
                           (make-tree 1 '() '())
                           (make-tree 7
                                      (make-tree 5 '() '())
                                      (make-tree 9
                                                 '()
                                                 (make-tree 11 '() '())))))
(display tree-2)
(newline)
(display (tree->list-1 tree-2))
(newline)
(display (tree->list-2 tree-2))
(newline)

; tree three
;(define tree-3 (make-tree '(5 (3 (1 nil nil) nil) (9 (7 nil nil) (11 nil nil)))))
(define tree-3 (make-tree 5
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      '())
                           (make-tree 9
                                      (make-tree 7 '() '())
                                      (make-tree 11 '() '()))))
(display tree-1)
(newline)
(display (tree->list-1 tree-3))
(newline)
(display (tree->list-2 tree-3))
(newline)

; a,产生的结果相同，产生的表为(1 3 5 7 9 11)
; b, 分析增长速度
; 采用展开的策略
; (tree->list-1 tree-1)
; (tree->list-1 (list 7
;                      (list 3
;                             (list 1 nil nil)
;                             (list 5 nil nil)
;                      (list 9
;                             nil
;                             (list 11 nil nil)))))
;(append (tree->list-1 (list 3
;                           (list 1 nil nil)
;                           (list 5 nil nil)))
;       (cons 7
;             (tree->list-1 (list 9
;                                 nil
;                                 (list 11 nil nil)))))

;  tree->list-1 的复杂度为 Θ(n^2)
;  tree->list-2 的复杂度为 Θ(n)
