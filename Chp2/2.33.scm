(load "p76.scm")

;  对比书中map的定义
(define nil '())

(define (my-map proc sequence)
  (accumulate (lambda (first already-accumulated)
                (cons (proc first) already-accumulated))
                nil
                sequence))

(define (my-append seq1 seq2)
    (accumulate cons seq2 seq1))

(define (my-length sequence)
      (accumulate (lambda (first already-acc)
                  (+ 1 already-acc))
                  0
                  sequence))

;; 加强对lambda的了解，理解还是不够透彻
;; Ref:
; 1. http://community.schemewiki.org/?sicp-ex-2.33
; 2. http://stackoverflow.com/questions/24601019/sicp-exercise-2-33-issue
; 3. 
