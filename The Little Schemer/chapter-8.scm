;; Lambda the Ultimate
;;
;; 第八章书中程序
;;-----------------------------------
;;                                  |
;;         高阶函数与CPS变换         |
;;                                  |
;;-----------------------------------

;; =======================高阶函数======================
;;
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

;; #f代表什么？??
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

;;=============== 开始介绍continutation的概念=======================

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

(define multirember-co
    (lambda (a lat col)
      (cond ((null? lat)
              (col nil nil))
            ((eq? (car lat) a)
              (multirember-co a (cdr lat)
                            (lambda (newlat seen)
                                      (col newlat
                                          (cons (car lat) seen)))))
            (else
              (multirember-co a (car lat)
                              (lambda (newlat seen)
                                        (col (cons (car lat) newlat)
                                             seen)))))))

;; 果col为a-friend，那么multirember&co的意思就是：member?
(define a-friend
    (lambda (x y)
        (null? y)))

(define new-friend
    (lambda (newlat seen)
        (col newlat
             (cons (car lat) seen))))

(define latest-friend
    (lambda (newlat seen)
        (a-friend (cons (quote and) newlat)
                  seen)))

;; 如果col为last-friend，那么multirember&co的意思就是：
;; lat中有多少个与a不同的S表达式
(define last-friend
    (lambda (x y)
        (length x)))

; 找到所有lat中old，并将new放到找到的old的左边
(define multiinsertL
    (lambda (new old lat)
        (cond ((null? lat) nil)
              ((eq? (car lat) old)
                (cons new
                      (cons old
                            (multiinsertL new old (cdr lat))))
              (else
                (cons (car lat)
                      (multiinsertR new old (cdr lat))))))))

(define multiinsertR
    (lambda (new old lat)
        (cond ((null? lat) nil)
              ((eq? (car lat) old)
                (cons (car lat)
                      (cons new
                            (multiinsertR new old (cdr lat)))))
              (else
                (cons (car lat)
                      (multiinsertR new old (cdr lat)))))))

;;multiinsertLR
(define multiinsertLR
    (lambda (new oldL oldR lat)
        (cond ((null? lat) nil)
              ((eq? (car lat) oldL)
                (cons new
                      (cons oldL
                            (multiinsertLR new oldL oldR (cdr lat)))))
              ((eq? (car lat) oldR)
                (cons oldR
                      (cons new
                            (multiinsertLR new oldL oldR (cdr lat)))))
              (else
                (cons (car lat)
                      (multiinsertLR new oldL oldR (cdr lat)))))))

;; multiinsertLR-co
;; col的newlat参数存放最后插入new参数后的newlat，
;; L参数是在oldL参数左边插入的次数, R参数是在oldR参数右边插入的次数。
(define multiinsertLR-co
    (lambda (new oldL oldR lat col)
        (cons ((null? lat)
                (col nil 0 0))
              ((eq? (car lat) oldL)
                (multiinsertLR-co new oldL oldR (cdr lat)
                                  (lambda (newlat L R)
                                      (col (cons new
                                                 (cons oldL newlat)
                                           (add1 L)
                                           R)))))
              ((eq? (car lat) oldR)
                (multiinsertLR-co new oldL oldR (cdr lat)
                                  (lambda (newlat L R)
                                      (col (cons new
                                                 (cons oldR newlat)
                                            L
                                            (addl R))))))
              (else
                (multiinsertLR-co new oldL oldR (cdr lat)
                                  (lambda (newlat L R)
                                      (col (cons (car lat)
                                                 (newlat)
                                            L
                                            R))))))))


(define even?
    (lambda (n)
      (= (* (/ n 2) 2) n)))

;; 找到列表中的所有的偶数
(define even-only
    (lambda (l)
        (cons ((null? l) nil)
              ((atom? (car l)
                (cons ((even? (car l))
                        (cons (car l)
                              (even-only (cdr l))))
                      (else
                        (even-only (cdr l)))))
              (else
                (cons (even-only (car l))
                      (even-only (cdr l))))))))

;; 找到列表中的所有偶数，并求出和或者乘积
;; col函数的第一个参数表示l列表中所有的偶数列表
;; 第二个参数表示所有偶数之积，第三个参数表示l列表中所有非偶数之和。
(define even-only-co
    (lambda (l col)
        (cond ((null? l)
                (col ni 1 0))
              ((atom? (car l))
                (cons ((even? (car l))
                        (even-only-co (cdr l)
                                      (lambda (newl p s)
                                          (col (cons (car l) newl)
                                               (* (car l) p)
                                               s))))
                      (else
                        (even-only-co (cdr l)
                                      (lambda (newl p s)
                                          (col newl
                                               p
                                               (+ (car l) s)))))))
              (else
                (even-only-co (car l)
                              (lambda (al ap as)
                                  (even-only-co (cdr l)
                                      (lambda (dl dp ds)
                                          (col (cons al dl)
                                               (* ap dp)
                                               (+ as ds))))))))))
;; 如果col为the-last-friend，那么evens-only*&co意思为：
;;    返回一个列表，列表的第一个S表达式为l参数中所有的偶数之积，
;;    列表的第二个S表达式为l参数中所有偶数之和，
;;    列表的剩余S表达式为l参数中所有的偶数。
(define the-last-friend
    (lambda (newl product sum)
        (cons sum
              (cons product newl))))
