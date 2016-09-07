;; Shadows
;; 第六章书中程序

;; 判断一个list是不是算术表达式
(define numbered?
    (lambda (aexp)
        (cond ((atom? aexp) (numbered? aexp))
              (else
                ((and (numbered? (car aexp))
                      (numbered? (caddr aexp))))))))
