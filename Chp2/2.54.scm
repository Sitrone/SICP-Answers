[The difference between eq?, eqv?, equal?, and = in Scheme?]
(http://stackoverflow.com/questions/16299246/what-is-the-difference-between-eq-eqv-equal-and-in-scheme)

(define (equal? a b)
        (if (and (pair? a) (pair? b))
            (and (equal? (car a) (car b)) 
                  (equal? (cdr a) (cdr b)))
            (eqv? a b)))
                  
    
