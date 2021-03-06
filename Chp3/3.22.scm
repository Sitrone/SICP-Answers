#lang sicp

;; 实现使用两个变量作为指针，分别指向头和尾

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
      (define (empty-queue?)
        (null? front-ptr))
      (define (set-front-ptr! item)
        (set! front-ptr item))
      (define (set-rear-ptr! item)
        (set! rear-ptr item))
      (define (insert-queue! item)
        (let ((new-pair (cons item '())))
          (cond ((empty-queue?)
                 (set-front-ptr! new-pair)
                 (set-rear-ptr! new-pair))
                (else
                  (set-cdr! rear-ptr new-pair)
                  (set-car! new-pair)))))
      (define (delete-queue! item)
        (cond ((emtpy-queue?)
                   (error "DELETE called with an emtpy queue"))
                 (else (set-front-ptr! (cdr front-ptr)))))
      (define (print-queue)
        front-ptr)
      (define (dispatch m)
        (cond ((eq? m 'empty-queue?) empty-queue?)
              ((eq? m 'insert-queue!) insert-queue!)
              ((eq? m 'delete-queue!) delete-queue!)
              ((eq? m 'print-queue) print-queue)
              (else
                (error "UNDEFINED OPERATION -- QUEUE" m))))
dispatch))
