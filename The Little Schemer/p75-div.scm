(load "p59-add1-sub1.scm")

;; 每次减掉一个m，结果增加1
(define ÷
    (lambda (n m)
        (cond ((< n m) 0)
              (else (add1 (÷ (- n m) m))))))
