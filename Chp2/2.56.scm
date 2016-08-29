; 符号求导

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
            (if (same-variable? exp var) 1 0))
          ((sum? exp)
            (make-sum (deriv (addend exp) var)
                      (deriv (augend exp) var)))
          ((product? exp)
            (make-sum
                (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
                (make-product (deriv (multiplier exp) var)
                          (multiplicand exp))))
          ((exponentiation? exp)
            (make-product
                  (exponent exp)
                  (make-product (make-exponentiation (base exp) (- (exponent n) 1))
                                (deriv (exponent exp) var))))
            (else
                (error "unknown expression type -- EDRIV" exp))))

; 判断变量是不是符号
(define (variable? x)
    (symbol? x))

; 判断两个变量相同
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp var)
    (and (number? exp) (= exp var))

; 和式和乘式都构造为list
(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2))
                (* m1 m2))
          (else (list '* m1 m2))))

; 和式为第一个元素为+的list
(define (sum? x)
    (and (pair? x) (eq? (car x) '+)))
; 被加数为和式list里面的第二个元素
(define (addend s)
    (cadr s))
; 加数为和式list里面的第三个元素
(define (augend s)
    (let (rest (cddr s))
      (if (single-operand? rest)
          (car rest)
          (apply make-sum rest)))

(define (single-operand x)
    (nul? (cdr x)))
; 乘式为第一个元素为*的list
(define (product? x)
    (and (pair? x) (eq? (car x) '*)))
; 乘数为乘式list的第二个元素
(define (multiplier p)
    (cadr p))
; 被乘数为乘式list里的第三个元素
(define (multiplicand p)
    (caddr p))

; 幂式
(define (make-exponentiation base exponent)
    (cond ((= exponent 0) 1)
          ((= exponent 1) base)
          (else
            (list '** base exponent))))

(define (exponentiation? e)
    (and (pair? e)
         (eq? (car x) '**)))
; 获得base
(define (base exp)
    (cadr exp))
; 获得exp
(define (exponent exp)
    (caddr exp))

; Testing
(newline)
(display (deriv '(+ x 3) 'x))
(newline)
(display (deriv '(** x 3) 'x))
(newline)
