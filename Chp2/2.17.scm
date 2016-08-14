(load "list-function.scm")

;; 分三种情况，空表，只有一个元素，大于等于一个元素
(define (last-pair items)
    (cond ((null? items)
            (error "list is empty")
          ((null? (cdr items)
            items)
          (else
              (last-pair (cdr items)))))))
