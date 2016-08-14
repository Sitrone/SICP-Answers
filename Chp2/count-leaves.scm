;; scheme提供了基本过程pair? 来判断参数是不是序列

(define (count-leaves x)
    (cond ((null? x) 0)
          ((not (pair? x)) 1)
          (else (+ (count-leaves (car x))
                   (count-leaves (cdr x))))))
