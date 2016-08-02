 ;; Supporting functions:

 (define nil '())

 (define (filter predicate sequence)
   (cond ((null? sequence) nil)
         ((predicate (car sequence))
          (cons (car sequence)
                (filter predicate (cdr sequence))))
         (else (filter predicate (cdr sequence)))))

 (define (accumulate op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence)
           (accumulate op initial (cdr sequence))))) 

 (define (enumerate-interval low high)
   (if (> low high)
       nil
       (cons low (enumerate-interval (+ low 1) high))))


 (define (flatmap proc seq)
   (accumulate append nil (map proc seq)))


;;Reuse flatmap
(define (uniq-pairs n)
    (flatmap (lambda (i)
                  (map (lambda (j) (list i j))
                        (enumerate-intervl 1 (- i 1))))
                    (enumerate-intervl 1 n)))

;;Test


;;If we change conditons to this :
;;distinct positive integers i , j less than or equal to a given n
;; Untested

(define (uniq-pairs-second n)
    (flatmap (lambda (i)
                    (map (lambda (j) (list i (- n i))
                        (enumerate-interval 1 n))))
                (enumerate-interval 1 n)))
