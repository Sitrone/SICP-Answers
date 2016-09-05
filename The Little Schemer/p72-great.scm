(load "p59-add1-sub1.scm")

;; 判0的时候，不能交换判断n,m的次序
;; 如果交换顺序，
(define >
    (lambda (n m)
        (cond ((zero? m) #f)
              ((zero? n) #t)
              (else
                (> (sub1 n) (sub1 m))))))
