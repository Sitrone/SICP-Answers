;; .. And Again, And Again, And Again, ..
;;
;; 第九章书中程序
;;-----------------------------------
;;                                  |
;;         停机问题和Y组合子         |
;;                                  |
;;-----------------------------------

(define keep-looking
    (lambda (a sorn lat)
      (cond ((number? sorn)
              (keep-looking a (pick sorn lat) lat))
            (else
              (eq? sorn a)))))

(define eternity
      (lambda (x)
        (eternity x)))

;; partial function, total function
;; Ref: https://www.zhihu.com/question/27620664

; length0
((lambda (length)
  (lambda (l)
    (cond ((null? l) 0)
          (else
            (add1 (length (cdr l)))))))
  eternity)


;; Y 组合子
(define Y
  (lambda (le)
    ((lambda (f) (f f))
     (lambda (f)
        (le (lambda (x) ((f f) x)))))))

      
