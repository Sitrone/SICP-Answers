(load "map.scm")

(define (square-list items)
    (if (null? items)
        nil
        (cons (square (car items))
              (square-list (cdr items)))))

(define (square-list-map items)
    (map (lambda (x) (* x x))
          items))

;; Testing
(define test-list
        (list 1 2 3 4))
(define (test1 test-list)
    (display test-list)
    (newline)
    (display "method 1")
    (newline)
    (display (square-list test-list))
    (newline)
    (display "method 2")
    (newline)
    (display (square-list-map test-list)))
