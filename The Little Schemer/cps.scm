;; 理解cps
;; 重写之前章节的递归程序
;; Ref:https://segmentfault.com/a/1190000005682123

;; 阶乘定义
(define (factorial n)
  (cond ((= n 1) 1)
        (else (* n (factorial (- n 1))))))

(define (factorial-cps n k)
  (cond ((= n 1) (k 1))
        (else (factorial-cps (- n 1) (lambda (v) (k (* v n)))))))

(define test (factorial-cps 5 (lambda (x) x)))

(display test)


;; 斐波那契数列
(define fib
    (lambda (n)
        (cond ((= n 0) 0)
              ((= n 1) 1)
              (else
                (+ (fib (- n 1))
                   (fib (- n 2)))))))

(define (fib-cps n k)
    (cond ((= n 0) (k 0))
          ((= n 1) (k 1))
          (else
            (fib-cps (- n 1)
                (lambda (v)
                    (fib-cps (- n 2)
                        (lambda (v1)
                          (k (+ v v1)))))))))


;; Ref:https://cgi.soic.indiana.edu/~c311/lib/exe/fetch.php?media=cps-notes.scm

(define rember8
    (lambda (ls)
        (cond ((null? ls) '())
              ((eq? (car ls) 8) (cdr ls))
              (else
                (cons (car ls)
                      (rember8 (cdr ls)))))))
;; First rule: whenever we see a lambda in the code we want to CPS, we
;; have to add an argument, and then process the body:

;; Second rule: "Don't sweat the small stuff!
;; Small stuff is stuff we know will terminate right away.

;; Don't sweat the small stuff if we know it will be evaluated.

;; Don't sweat the small stuff if it *might* be evaluated, but instead
;; pass it to k.

(define rember8-cps
    (lambda ls k)
        (cond ((null? ls) (k '()))
              ((eq? (car ls) 8) (k (cdr ls)))
              (else
                (rember8-cps (cdr ls) (lambda (x) (cons (car ls) x))))))
;; summary:
;; First, all non-small stuff calls are tail calls. Here's the program
;; with the tail calls surrounded by asterisks:

;; Second, all arguments are small stuff. Yep, even the lambda in the
;; else line, because lambda is *always* small stuff.

(define multirember8
    (lambda (ls)
        (cond ((null? ls) nil)
              ((eq? (car ls) 8)
                (multirember8 (cdr ls)))
              (else
                (cons (car ls)
                      (multirember8 (cdr ls)))))))

(define multirember8-cps
    (lambda (ls k)
        (cond ((null? ls) (k nil))
              ((eq? (car ls) 8)
                (multirember8 (cdr ls) (lambda (x) (k x))))
              (else
                (multirember8 (cdr ls) (lambda (x) (k (cons (car ls) x))))))))

;; lambda (x) (k x)) means:It's taking whatever is passed to it, and passing it to k.
