(load "sum.scm")
(load "even-and-odd.scm")

;; 拆分成奇偶来求
(define (simpson-sum f a b n)
    (define h (/ (- b a) n))
    (define (add-2h x) (+ x (* 2 h)))
    (* (/ h 3.0) (+ (f a)
                    (* 4.0 (sum f (+ a h) add-2h (- b h)))
                    (* 2.0 (sum f (add-2h a) add-2h (- b h)))
                    (f (+ a (* h n))))))
;; 将奇偶进行合并求解
; (define (simpson f a b n)
;   (define h (/ (- b a) n))
;
;   (define (y k)
;     (f (+ a (* k h))))
;
;   (define (ypair k)
;     (+ (* 2 (y k))
;        (* 4 (y (+ k 1)))))
;
;   (define (add-2 k)
;     (+ k 2))
;
;   (* (/ h 3) (+ (sum ypair 0 add-2 (- n 1))
;                 (- (f b) (f a)))))
