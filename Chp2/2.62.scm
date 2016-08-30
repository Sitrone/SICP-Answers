(load "2.61.scm")

(define (union-set set1 set2)
    (cond ((null? set1)
              set2)
          ((null? set2)
              set1)
          ((and (null? set1) (null? set2))
              nil)
          (else
            (let ((x1 (car set1)) (x2 (car set2)))
              (cond ((= x1 x2)
                      (cons x1
                          (union-set (cdr set1) (cdr set2))))
                    ((< x1 x2)
                      (cons x1
                            (union-set (cdr set1) set2)))
                    ((> x1 x2)
                      (cons x2
                            (union-set set1 (cdr set2)))))))))


; 注意对空表的判断
; Testing
(display (union-set '(3 5 6) '(1 2 4)))
(newline)
