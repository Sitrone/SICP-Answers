#lang sicp

;; 对make-account的再一次包装
(define (make-joint account old-passwd new-passwd)
  (lambda (given-passwd mode)
    (if (eq? given-passwd new-passwd)
          (account old-passwd mode)
          display-wrong-another-password-message)))

(define (display-wrong-another-password-message useless-arg)
    (display "Incorrect another password"))
