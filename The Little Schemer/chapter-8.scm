;; Lambda the Ultimate
;;
;; 第八章书中程序

(define rember-f
    (lambda (test? a l)
        (cons ((null? l) nil)
              ((test? (car l) a) (cdr l))
              (else
                (cons (car l)
                      (rember-f test? a (cdr l)))))))



;; 使用currying重写rember-f
(define rember-f
    (lambda (test?)
      (lambda (a l)
        (cond ((null? l) nil)
              ((test? (car l) a) (cdr l))
              (else
                (cons (car l)
                      ((rember-f test?) a (cdr l))))))))


;; insertL-f
(define insertL-f
    (lambda (test?)
        (lambda (new old l)
          (cond ((null? l) nil)
                ((test? (car l) old)
                  (cons new
                        (cons old (cdr l))))
                (else
                  (cons (car l)
                        ((insertL-f test?) new old (cdr l))))))))

;; insertR-f
(define insertR-f
    (lambda (test?)
      (lambda (new old l)
          (cond ((null? l) nil)
                ((test? (car l) old)
                  (cons old
                        (cons new (cdr l))))
                (else
                  (cons (car l)
                        ((insertR-f test?) new old (cdr l))))))))


;; 可以看出insertR-f和insertL-f只有中间一部分不同
;; 因此要想办法给抽象出来
(define seqL
    (lambda (new old l)
        (cons new
              (cons old l))))
(define seqR
    (lambda (new old l)
        (cons old
              (cons new l))))

(define insert-g
    (lambda (seq)
      (lambda (new old l)
          (cond ((null? l) nil)
                ((eq? (car l) old)
                  (seq new old (cdr l))
                (else
                  (cons (car l)
                        ((insert-g seq) new old (cdr l)))))))))

;; 所有上面的insertR-f和insertL-f可以写为
(define insertL-f
    (insert-g seqL))
(define insertR-f
    (insert-g seqR))

;; 不适用定义的seqL和seqR
(define insertR-f
    (insert-g
      (lambda (new old l)
          (cons old
                (cons new l)))))

;; 重新定义subst
(define subst
    (insert-g
      (lambda (new old l)
          (cons new l))))

;; #f代表什么？
(define rember
    (lambda (a l)
      (insert-g seqrem) #f a l))
(define seqrem
    (lambda (new old l)
        l))


;; 重新抽象value
(define atom-to-function
    (lambda (x)
      (cond ((eq? x '+) +)
            ((eq? x '*) *)
            (else
              up))))
(define value
    (lambda (nexp)
        (cond ((atom? nexp) nexp)
              (else
                ((atom-to-function (operator nexp))
                  (value (1st-sub-exp nexp))
                  (value (2st-sub-exp nexp)))))))

;; redifine multirember-f
(define multirember-f
    (lambda (test?)
      (lambda (a lat)
        (cond ((null? lat) nil)
              ((test? a (car lat))
                ((multirember-f test?) a (cdr lat))
              (else
                (cons (car lat)
                      ((multirember-f test?) a (cdr lat)))))))))

(define multirember-eq
    (multirember-f test?))


(define multirember-T
    (lambda test? lat)
      (cond ((null? lat) nil)
            ((test? (car lat))
              (multirember-T test? (cdr l)))
            (else
              (cons (car lat)
                    (multirember-T test? (cdr l))))))


                                     
