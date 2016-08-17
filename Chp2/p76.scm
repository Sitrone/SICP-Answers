(load "map.scm")

; filter
(define (filter predicate sequence)
    (cond ((null? sequence) nil)
          ((predicate (car sequence))
            (cons (car sequence)
                  (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

; accumulate
(define (accumulate op initinal sequence)
    (if (null? sequence)
        initinal
        (op (car sequence)
            (accumulate op initinal (cdr sequence)))))

; 枚举区间
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))

; 枚举所有树叶
(define (enumerate-tree tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (list tree))
          (else (append (enumerate-tree (car tree))
                        (enumerate-tree (cdr tree))))))

; Application
(define (list-fib-squares n)
    (accumulate cons
                  nil
                    (map square
                              (map fib
                                    (enumerate-interval 1 n)))))
