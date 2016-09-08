;; Shadows
;;
;; 第六章书中程序

;; 判断一个list是不是算术表达式
(define numbered?
    (lambda (aexp)
        (cond ((atom? aexp) (numbered? aexp))
              (else
                ((and (numbered? (car aexp))
                      (numbered? (caddr aexp))))))))


;; 中缀表达式
(define value
    (lambda (nexp)
      (cond ((atom? nexp) nexp)
            ((eq? (cadr nexp)) quote +)
              (+ (value (car nexp))
                 (value (caddr nexp)))
            ((eq? (cadr nexp)) quote x)
              (* (value (car nexp))
                 (value (caddr nexp)))
            (else
              (up (value (car nexp))
                  (value (caddr nexp)))))))

;; 前缀表达式
(define value
  (lambda (nexp)
      (cond ((atom? nexp) nexp)
            ((eq? (car nexp) quote +))
              (+ (value (cadr nexp))
                 (value (caddr nexp)))
            ((eq? (car nexp) quote x))
              (* (value (cadr nexp))
                 (value (caddr nexp)))
            (else
              (up (value (cadr nexp))
                  (value (caddr nexp)))))))

;; 另外一种形式表示数，0，加1和减1
;; 如，0为(), 1为(()),2为((),())
(define sero?
    (lambda (n)
      (null? n)))
(define edd1
    (lambda (n)
      (cons nil n)))
(define zub1
    (lambda (n)
      (cdr n)))

(define +
    (lambda (n m)
        (cond ((sero? m) n)
              (else
                (edd1 (+ n (zub1 m)))))))
(define lat?
    (lambda (l)
      (cond ((null? l) #t)
            ((atom? (car l))
              (lat? (cdr l)))
            (else
              #f))))
