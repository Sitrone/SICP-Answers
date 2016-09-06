;; 判断两个元素是不是同一个atom

(define eqan?
    (lambda (a1 a2)
        (cond ((and (number? a1) (number? a2))
                (= a1 a2))
              ((or (number? a1) (number? a2))
                #f)
              (else
                (eq? a1 a2)))))

;; 可以用eqan?代替所有的eq?来判断，除了eqan?自己判断自己
