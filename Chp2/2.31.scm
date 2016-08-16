(define nil '())

(define (square-tree tree)
    (tree-map square tree))

;method one
(define (tree-map proc tree)
    (cond ((null? tree) nil)
          ((not (pair? tree))
              (proc tree))
          (else
              (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

; method two
(define (tree-map-2 proc tree)
    (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (tree-map proc sub-tree)
              (proc sub-tree)))
          tree))
