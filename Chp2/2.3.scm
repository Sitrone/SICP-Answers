#lang sicp

;;=================method 1 =======================                                                                                                                                                                                                                                                                                                                                                                                              
(#%require "2.2.scm")

(define (make-rect bottom-left top-right)
      (cons bottom-left top-right))
; devfine four points
(define (bottom-left rect)
      (car rect))
(define (bottom-right rect)
      (make-point (x-point (cdr rect))
                  (y-point (car rect))))
(define (top-left rect)
      (make-point (x-point (car rect))
                  (y-point (cdr rect))))
(define (top-right rect)
      (cdr rect))

; define width and length
(define (rect-length rect)
      (abs (- (x-point (bottom-left rect))
              (x-point (top-right rect)))))
(define (rect-width rect)
      (abs (- (y-point (bottom-left rect))
              (y-point (top-right rect)))))

; return area
(define (rect-area rect)
      (* (rect-width rect)
         (rect-length rect)))

; return circumstance
(define (rect-cir rect)
      (* 2 (+ (rect-length rect)
              (rect-width rect))))
; Testing
(define  rect-test (make-rect (make-point 2 2)
                  (make-point 4 6)))
(rect-area rect-test)
(rect-cir rect-test)

;;====================method 2================
(define (make-rect-2 bottom-left width length)
      (cons bottom-left (cons width length)))
(define (rect-length rect)
      (cdr (cdr rect)))
(define (rect-width rect)
      (cdr (car rect)))

; Testing
(define test2 (make-rect-2 (make-point 2 2) 4 2))
(display test2)
(rect-area test2)
(rect-cir test2)
