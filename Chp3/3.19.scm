;; 列表有环判断，双指针跑圈法
(load "3.13.scm")

(define (has-cycle? lst)
  (define (iter x y)
    (let ((x-walk (list-walk 1 x))
          (y-walk (list-walk 2 y)))
        (cond ((or (null? x-walk) (null? y-walk))
               #f)
              ((eq? x-walk y-walk)
               #t)
              (else
                (iter x-walk y-walk)))))
  (iter lst lst))

(define (list-walk step lst)
  (cond ((null? lst)
         '())
        ((= step 0)
          lst)
        (else
          (list-walk (- step 1)
                     (cdr lst)))))

;testing
(display (has-cycle? (list 'a 'b 'c 'd)))
(newline)
(display (has-cycle? (make-cycle (list 1 2 3))))
(newline)
