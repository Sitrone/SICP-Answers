;; What Is the value of All of This?
;;
;; 第十章书中程序
;;-----------------------------------
;;                                  |
;;        scheme 解释器             |
;;                                  |
;;-----------------------------------
;; 简化版的scheme解释器，用scheme自身实现自解释，亦称：自举
;;Ref，可以参考王垠40行代码: https://www.zhihu.com/question/20822815

(define new-entry build)

;; 根据name在entry中查找对应的值
;; entry-f 用来处理entry不存在name的情况
(define lookup-in-entry
    (lambda (name entry entry-f)
      (lookup-in-entry-help name
                          (first entry)
                          (second entry)
                          entry-f)))

(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond ((null? names) (entry-f name))
          ((eq? (car names) name)
            (car values))
          (else
            (lookup-in-entry-help name
                                (cdr names)
                                (cdr values)
                                entry-f)))))

;; table 也叫environment，一个列表，里面的所有S表达式都是entry
;; extend-table
(define extend-table cons)

(define lookup-in-talbe
  (lambda (name table table-f)
    (cond ((null? talbe) (table-f name))
          (else
            (lookup-in-entry name
                             (car table)
                             (lambda (name)
                                (lookup-in-talbe name
                                                 (cdr table)
                                                 table-f)))))))
;; scheme中的six种基本类型
;; const, quote, identifier, lambda, cond, application

(define expression-to-action
  (lambda (e)
    (cond ((atom? e) (atom-to-function e))
          (else
            (list-to-action e)))))

;; 判断atom类型的S表达式属于哪种语义类型，返回对应的处理函数
(define atom-to-action
  (lambda (e)
    (cond
     ((number? e) *const)
     ((eq? e #t) *const)
     ((eq? e #f) *const)
     ((eq? e (quote cons)) *const)
     ((eq? e (quote car)) *const)
     ((eq? e (quote cdr)) *const)
     ((eq? e (quote null?)) *const)
     ((eq? e (quote eq?)) *const)
     ((eq? e (quote atom?)) *const)
     ((eq? e (quote zero?)) *const)
     ((eq? e (quote add1)) *const)
     ((eq? e (quote sub1)) *const)
     ((eq? e (quote number?)) *const)
     (else *identfier))))


;;
(define list-to-action
  (lambda (e)
    (cond
     ((atom? (car e))
      (cond
       ((eq? (car e) (quote quote)) *quote)
       ((eq? (car e) (quote lambda)) *lambda)
       ((eq? (car e) (quote cond)) *cond)
       (else *application)))
     (else *application))))

(define value
  (lambda (e)
    (meaning e (quote ()))))

;; e:需要解释的S表达式
;; table: 用来存储与S表达式对应的上下文环境
(define meaning
  (lambda (e table)
    ((expression-to-action e) e table)))

(define *const
  (lambda (e table)
    (cond ((number? e) e)
          ((eq? e #t) #t)
          ((eq? e #f) #f)
          (else
            (build (quote primitive) e)))))

(define *quote
  (lambda (e table)
    (text-of e)))
(define text-of second)

(define *identfier
  (lambda (e table)
    (lookup-in-talbe e table initial-table)))

(define initial-table
  (lambda (name)
    (car (quote ()))))


;; primitive function: scheme本身提供的一些基本函数，也就是在写scheme解释器之前预先定义好的函数
;; non-primitive function: 用户通过(lambda ...)定义的函数
;; 解析到non-primitive function时候需要把它的参数和函数体保存到table中，等待之后的identifier调用
(define *lambda
  (lambdad (e table)
    (build (quote non-primitive)
           (cons table (cdr e)))))

;; 定义help函数，方便取出对应的数据
(define table-of first)
(define formals-of second)
(define body-of third)

(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e) table)))

(define evcon
  (lambda (lines table)
    (cond ((else? (question-of (car lines)))
            (meaning (answer-of (car lines))
                     table))
          ((meaning (question-of (car lines))
                    table))
          (meaning (answer-of (car lines))
                   table))
          (else
            (evcon (cdr lines)
                   table))))

;; 判断某个S表达式是否是else的分支
(define else?
  (lambda (x)
    (cond ((atom? x) (eq? x (quote else)))
          (else
            #f))))

(define question-of first)
(define answer-of second)

;; *application
;; 表示一个列表，列表的第一个元素表示一个函数，剩余的元素表示该函数的调用参数
(define *application
  (lambda (e table)
    (applay
        (meaning (function-of e) table)
        (evlis (arguments-of e) table))))

; 获取调用参数中每参数所对应的值。
(define evlis
  (lambda (args table)
    (cond
     ((null? args) (quote ()))
     (else (cons (meaning (car args) table)
                 (evlis (cdr args) table))))))

(define function-of first)
(define arguments-of second)

;; 执行函数调用
;; 1. primitive function
;; 2. non-primitive function

(define apply
  (lambda (func vals)
    (cond
     ((primitive? fun)
      (apply-primitive (second fun) vals))
     ((non-primitive? fun)
      (apply-closure (second fun) vals)))))


(define primitive?
  (lambda (l)
    (eq? (first l) (quote primitive))))
(define non-primitive?
  (lambda (l)
    (eq? (first l) (quote non-primitive))))


(define apply-primitive
  (lambda (name vals)
    (cond
     ((eq? name (quote cons))
      (cons (first vals) (second vals)))
     ((eq? name (quote car))
      (car (first vals)))
     ((eq? name (quote cdr))
      (cdr (first vals)))
     ((eq? name (quote null?))
      (null? (first vals)))
     ((eq? name (quote eq?))
      (eq? (first vals)))
     ((eq? name (quote atom?))
      (:atom? (first vals)))
     ((eq? name (quote zero?))
      (zero? (first vals)))
     ((eq? name (quote add1))
      (add1 (first vals)))
     ((eq? name (quote sub1))
      (sub1 (first vals)))
     ((eq? name (quote number?))
      (number? (first vals))))))

(define :atom?
  (lambda (x)
    (cond
     ((atom? x) #t)
     ((null? x) #f)
     ((eq? (car x) (quote primitive)) #t)
     ((eq? (car x) (quote non-primitive)) #t)
     (else #f))))

;; 将调用参数及非原语函数的参数组成一个entry（组成对应关系）
;; 然后添加到table中，再对该非原语函数的函数体求值即可。
(define apply-closure
  (lambda (closure vals)
    (meaning (body-of closure)
             (extend-table (new-entry (formals-of closure)
                                      vals)
                           (table-of closure)))))
