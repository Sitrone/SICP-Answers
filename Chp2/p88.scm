#lang sicp

; 图形语言的抽象
(#%require "2.44.scm")

(define (right-split)
    (if (= n 0)
        painter
        (let ((smaller (right-split (- n 1))))
          (beside painter (below smaller smaller)))))

(define (corner-split painter n)
    (if (= n 0)
        painter
        (let ((up (up-split painter (- n 1)))
             (right (right-split painter (- n 1))))
          (let ((top-left (beside up up))
                (bottom-right (below right right))
                (corner (corner-split painter (- n 1))))
            (beside (below painter top-left)
                    (below bottom-right corner))))))

(define (spuare-limit painter n)
    (let ((quarter (corner-split painter n)))
      (let ((half (beside (flip-horiz quarter) quarter)))
          (below (flip-vert half) half))))

  
