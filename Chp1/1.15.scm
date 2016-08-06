(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sin angle)
        (if (not (> (abs angle) 0.1))
            angle
            (p (sin (/ angle 3.0)))))

(sin 12.15)
;; 调用5次
(p (sin 4.05)
(p (p (sin 1.3499999)))
(p (p (p (sin 0.449999999))))
(p (p (p (p (sin 0.15)))))
(p (p (p (p (p (sin 0.05))))))


;; 时间和空间复杂度都是O(loga)
;; 可以通过使用trace函数来跟踪验证
