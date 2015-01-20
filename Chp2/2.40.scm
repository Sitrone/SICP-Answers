;;Supporting functions



;;Reuse flatmap
(define (uniq-pairs n)
    (flatmap (lambda (x)
                  (map (lambda (j) (list i j))
                        (enumerate-intervl 1 (- i 1))))
                    (enumerate-intervl 1 n)))

;;Test


;;If we change conditons to this :
;;
