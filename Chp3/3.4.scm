#lang sicp

(define (make-account balance password)
  (define password-num 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
;;  修改，增加密码次数验证过程
  (define (password-verify? input-password)
    (cond ((eq? password input-password)
            (set! password-num 0) #t)
          ((< password-num 7)
            (set! password-num (+ password-num 1)) #f)
          (else
            (call-the-cops))))

  (define (dispatch input-password m)
    (if (password-verify? input-password)
        (cond ((eq? m 'withdraw)
                withdraw)
              ((eq? m 'deposit)
                deposit)
              (else
                (error "Unkonwn request -- MAKE-ACCOUNT")))
    (lambda (x) "Incorrect password")))
  dispatch)

;Testing
(define acc (make-account 100 'secret-password))
(newline)
(display ((acc 'secret-password 'withdraw) 40))
(newline)
(display ((acc 'some-other-password 'deposit) 60))
