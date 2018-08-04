#lang sicp

;;  使用memq
;; see also: http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-ref/Searching-Lists.html#Searching-Lists

(define (count-pairs x)
  (length (inner x '())))

(define (inner x memo-list)
  (if (and (pair? x)
           (false? (memq x memo-list)))
      (inner (car x)
             (inner (cdr x)
                    (cons x memo-list)))
      memo-list))
;; 定义一个记录列表，用来维护访问过的序对
;; memq 检查序对是否存在与表内

;testing
(display (count-pairs (list 'a 'b 'c 'd)))
(newline)
(display (count-pairs (let ((x (cons 1 2)))
            (cons x x))))
(newline)
