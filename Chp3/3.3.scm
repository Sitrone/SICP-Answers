#lang sicp

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
;; newly add    
  (define (password-verify? input-password)
    (eq? password input-password))

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
