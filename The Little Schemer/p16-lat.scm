(load "atom.scm")

; 测试tuple中的元素是不是都是atom
(define lat?
    (lambda (l)
        (cond
            ((null? l) true)
            ((atom? (car l)) (lat? (cdr l)))
            (else
                false))))

; Testing
(define test '(bacon and eggs))
(display (lat? test))
