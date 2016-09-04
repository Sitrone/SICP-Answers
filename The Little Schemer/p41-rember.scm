(load "p16-lat.scm")

; remove a in lat, 如果列表中存在a，则返回移除a之后的列表，只移除第一处出现的地方
(define rember
    (lambda (a lat)
        (cond ((null? lat) (quote ())
              ((eq? (car lat) a) (cdr lat))
              (else (cons (car lat)
                          (rember a
                                  (cdr lat))))))))

;Testing
(newline)
(define test '(ice cream with fudge for dessert))
(display (rember 'ice test))
; (cream with fudge for dessert)
