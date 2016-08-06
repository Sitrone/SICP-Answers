(load "even-and-odd.scm")

(define (double x)
           (+ x x))
(define (halve n)
        (if (even? n) (/ n 2)))
(define (* a b)
        (if (= b 0)
            0
            (+ a ( a (- b 1)))))

(define (muti a b)
          (cond ((= b 0) 0)
                ((even? b) (double (muti a (halve b))))
                ((odd? b) (+ a (muti a (- b 1))))))
