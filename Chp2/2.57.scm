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

; length of the list
(define (length s)
  (define (len-iter s count)
      (if (null? s)
          count
          (len-iter (- s 1) (+ count 1))))
  (len-iter s 0))

; 判断变量是不是符号
(define (variable? x)
    (symbol? x))

; 判断两个变量相同
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp var)
    (and (number? exp) (= exp var))

; 和式和乘式都构造为list
(define (make-sum-list li)
    (if (= (length li) 2)
        (list '+ (car li) (cadr li))
        (make-sum (car li)
                  (make-sum-list (cdr li)))))

(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (make-sum-list (a1 a2)))))

(define (make-product-list li)
    (if (= (length li) 2)
        (list '* (car li) (cadr li))
        (make-product (car li)
                      (make-product-list (cdr li)))))
(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2))
                (* m1 m2))
          (else (make-product-list (list m1 m2)))))


; 和式为第一个元素为+的list
(define (sum? x)
    (and (pair? x) (eq? (car x) '+)))
; 被加数为和式list里面的第二个元素
(define (addend s)
    (cadr s))
; 加数为和式list里面的第三个元素
(define (augend s)
    (let ((rest (cddr s)))
       (if (= (length rest) 1)
           (car rest)
           (make-sum-list s))))


; 乘式为第一个元素为*的list
(define (product? x)
    (and (pair? x) (eq? (car x) '*)))
; 乘数为乘式list的第二个元素
(define (multiplier p)
    (cadr p))

; 被乘数为乘式list里的第三个元素
(define (multiplicand p)
  (let ((rest (cddr p)))
    (if (= (length rest) 1)
        (car rest)
        (make-product-list rest))))

; Testing
(newline)
(display (deriv '(+ x 3) 'x))
(newline)
