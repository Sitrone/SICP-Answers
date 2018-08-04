#lang sicp



(define (make-mobile left right)
    (list left right))
(define (make-branch length structure)
    (list length structure))

; one
(define (left-branch moble)
    (car tree))
(define (right-branch mobile)
    (cdr tree))
(define (branch-length branch)
    (car branch))
(define (branch-structure branch)
    (cdr branch))

; two
(define (total-weight mobile)
    (+ (branch-weight (left-branch mobile))
       (branch-weight (right-branch mobile))))
; 如果分支吊着另一个活动体，那么这个活动体的总重量就是这个分支的重量
; 否则，分支的structure部分就是分支的重量
(define (branch-weight branch)
    (if (hangs-another-mobile? branch)
        (total-weight (branch-structure branch))
        (branch-weight branch)))
(define (hangs-another-mobile? branch)
    (pair? (branch-structure branch)))

; three
(define (branch-torque branch)
    (* (branch-length branch)
       (branch-weight branch)))
(define (mobile-balance? mobile)
    (let ((left (left-branch mobile))
         (right (right-branch mobile)))
         (and (same-torque? left right)
              (branch-balance? left)
              (branch-balance? right))))

(define (same-torque? left right)
    (= (branch-torque left)
       (branch-torque right)))
(define (branch-balance? branch)
    (if (hangs-another-mobile? branch)
        (mobile-balance? (branch-structure branch))
        #t))
