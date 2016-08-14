(load "2.18.scm")

(define (cc amount conin-values)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (no-more? conin-values)) 0)
          (else
            (+ (cc  amount
                   (except-first-denomination conin-values))
               (cc (- amount
                        (first-denomination conin-values))
                    conin-values)))))

(define (first-denomination item-kinds)
    ())
