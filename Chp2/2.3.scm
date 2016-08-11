;;=================method 1 =======================                                                                                                                                                                                                                                                                                                                                                                                              
; return area
(load "2.2.scm")
(define (rect-area rect)
    (* (rect-width rect)
       (rect-length rect)))

; return circumstance
(define (rect-cir rect)
    (* 2 (+ (rect-length rect)
            (rect-width rect))))

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
      (abs (- (x-point bottom-left)
              (x-point top-right))))
(define (rect-width rect)
      (abs (- (y-point bottom-left)
              (y-point top-right))))
; Testing
(define  rect-test (make-rect (make-point 2 2)
                  (make-point 4 6)))
(rect-area rect-test)
(rect-cir rect-test)

;;====================method 2================
