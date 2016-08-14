(load "2.18.scm")

(define (cc amount conin-values)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (no-more? conin-values)) 0)
          (else
            (+ (cc  amount
                   (except-first-denomination conin-values))
               (cc (- amount
                        (first-denomination conin-values))
                    conin-values)))))

(define (first-denomination conin-values)
    (car conin-values))
(define (except-first-denomination conin-values)
    (cdr conin-values))
(define (no-more? conin-values)
    (null? conin-values))

; Testing
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

; 顺序不会影响找零结果，可以进行测试，采用逆序测试
