(load "atom.scm")


;; 组合两个列表中对应元素的和为新的tuple，初始版本只考虑了两个tup元素个数相等的情况
(define tup+
    (lambda (tup1 tup2)
        (cond ((and (null? tup1) (null? tup2)) nil)
              (else
                (cons (+ (car tup1) (car tup2))
                      (tup+ (cdr tup1) (cdr tup2)))))))


;; 改进版，适应任何tup相加
(define tup+
    (lambda (tup1 tup2)
        (cond ((null? tup1) tup2)
              ((null? tup2) tup1)
              (else
                (cons (+ (car tup1) (car tup2))
                      (tup+ (cdr tup1) (cdr tup2)))))))
