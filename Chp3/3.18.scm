(define (has-cycle? lst)
  (let ((identity (cons '() '())))
    (define (iter remain-list)
      (cond ((null? remain-list)
              #f)
            ((eq? identity (car remain-list))
              #t)
            (else
              (set-car! remain-list identity)
              (iter (cdr remain-list)))))
      (iter lst)))

Ref: http://sicp.readthedocs.io/en/latest/chp3/18.html
