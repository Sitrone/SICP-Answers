;; Oh My Gawd. It's full of Stars
;;
;; 第五章书中程序
(load "atom.scm")
(load "p59-add1-sub1.scm")

;; 对于层次性的列表，需要先判断取出来的（car l）是否是atom
(define rember*
    (lambda (a l)
        (cond ((null? l) nil)
              ((atom? (car l)
                (cond ((eq? (car l) a)
                       (rember* a (cdr l)))
                      (else
                        (cons (car l)
                              (rember* a (cdr l))))))
              (else
                (cons (rember* a (car l))
                      (rember* a (cdr l))))))))

;; 层次性列表插入，先判断是否是atom
;; 如果是，判断是否等于old，是的话插入old右边，同时对剩下的继续递归；如果不是直接递归剩下的
;; 不是atom，则分别递归前面和后面两部分
(define insertR*
    (lambda (new old l)
        (cond ((null? l) nil)
              ((atom? (car l)
               (cond ((eq? old (car l))
                      (cons old
                            (cons new (insertR* new old (cdr l))))))
                     (else
                       (cons (car l)
                             (insertR* new old (cdr l))))))
              (else
                (cons (insertR* new old (car l))
                      (insertR* new old (cdr l)))))))

;; 第一定律终结版
;; When recurring on a list of atoms, `lat`, ask two questions about it: `(null? lat)` and `else`.

;; When recurring on a number, `n`, ask two questions about it: `(zero? n)` and `else`.

;; When recurring on a list of S-expressions, `l`, ask three question about it: `(null? l)`, `(atom? (car l))`, and `else`.

;; 第四定律终结版
;; Always change at least one argument while recurring.

;;  When recurring on a list of atoms, `lat`, use `(cdr lat)`.
;;  When recurring on a number, `n`, use `(sub1 n)`.
;;  And when recurring on a list of S-expressions, `l`, use `(car l)` and `(cdr l)` if neither `(null? l)` nor `(atom? (car l))` are true.

;; It must be changed to be closer to termination. The changing argument must be tested in the termination condition:

;;  When using `cdr`, test termination with `null?`
;;  When using `sub1`, test termination with `zero?`

;; 计算层次列表中a元素出现的次数，分析思路同上
(define occursomething
    (lambda (a l)
        (cond ((null? l) 0)
              ((atom? (car l))
                (cond ((eq? (car l) a)
                        (add1 (occursomething a (cdr l))))
                      (else
                        (occursomething a (cdr l)))))
              (else
                (+ (occursomething a (car l))
                   (occursomething a (cdr l)))))))


;; 层次性列表的元素替换，思路同上
(define subst*
    (lambda (new old l)
        (cond ((null? l) nil)
              ((atom? (car l))
                (cond ((eq? (car l) old)
                        (cons new
                              (subst* new old (cdr l))))
                      (else
                        (cons (car l)
                              (subst* new old (cdr l)))))
                (else
                  (cons (subst* new old (car l))
                        (subst* new old (cdr l))))))))
