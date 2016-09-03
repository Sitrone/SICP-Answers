;; 查看p100.scm程序，修改为数据导向的风格

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp) (if (same-variable? exp var) 1 0))
          (else ((get 'deriv (operator exp)) (operands exp)
                                             var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; a
;; same-variable和number是通用操作，不需要放到数据导向里面，放进去会多次一举

;; b,操作符号已经取出来，只需要考虑操作数

;; 数据导向，加法求导程序
(define (install-sum-package)
(define (addend s) (car s))
(define (augend s) (cadr s))
(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2))
            (+ a1 a2))
          (else
            (attach-tag '+ a1 a2))))

; interface of the rest system
(put 'addend '+ addend)
(put 'augend '+ augend)
(put 'make-sum '+ make-sum)
(put 'deriv '+
      (lambda (exp var)
          (make-sum (deriv (addend exp) var)
                    (deriv (augend exp) var))))
'done)

;; 数据导向，乘法求导程序
(define (install-mul-package)

;; internal procedures
(define (multiplier x) (car x))
(define (multiplicand x) (cadr x))
(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2))
                (* m1 m2))
          (else
            (attach-tag '* m1 m2))))
;; interface of the rest of the system
(put 'multiplier '* multiplier)
(put 'multiplicand '* multiplicand)
(put 'make-product '* make-product)
(put 'deriv '*
      (lambda (exp var)
          (make-sum
                    (make-product (multiplier exp)
                                  (deriv (multiplicand exp) var))
                    (make-product (deriv (multiplier exp) var)
                                  (multiplicand exp))))
'done)

;; c
; 数据导向，幂的求导程序
(define (install-exp-package )

;;internal procedures
(define (base x) (car x))
(define (exponent x) (cadr x))
(define (make-exponentiation base exponent)
    (cond ((= exponent 0) 1)
          ((= exponent 1) base)
          (else
            (attach-tag '** base exponent))))

;; interface of the rest of the system
(put 'base '** base)
(put 'exponent '** exponent)
(put 'make-exponentiation '** make-exponentiation)
(put 'deriv '**
    (lambda (exp var)
        (make-product
                    (exponent exp)
                    (make-product (make-exponentiation (base exp) (- (exponent n) 1))
                                  (deriv (exponent exp) var)))))
'done)

;; d
;; ((get (operator exp) 'deriv) (operands exp) var)
;; 包里面的主体无需更改，只需要换个位置，eg
; (put 'make-product '* make-product)
; to
; (put '* 'make-product make-product)
