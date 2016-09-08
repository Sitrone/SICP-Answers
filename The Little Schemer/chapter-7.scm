;; Friends and Relations
;;
;; 第七章书中程序

;; 判断list是否是set
(define set?
    (lambda (l)
      (cond ((null? l) #t)
            ((member? (car l) (cdr l))
              #f)
            (else
              (set? (cdr l))))))

;; 去重list
(define makeset
    (lambda (lat)
        (cond ((null? lat) nil)
              ((member? (car lat) (cdr l))
                (makeset (cdr lat))
              (else
                (cons (car lat)
                      (makeset (cdr lat))))))))

;; 使用mutirember简化makeset
(define makeset
    (lambda (lat)
        (cond ((null? lat) nil)
              (else
                (cons (car lat)
                      (makeset (mutirember (car lat)
                                           (cdr lat))))))))

;; 查找set1是不是set2的子集
(define subset?
    (lambda (set1 set2)
        (cond ((null? set1) #t)
              ((member? (car set1) set2)
                (subset? (cdr set1) set2))
              #f)))

;; 使用and重写subset?
(define subset?
    (lambda (set1 set2)
      (cond ((null? set1) #t)
            (else
              (and (member? (car set1) set2)
                   (subset? (cdr set1) set2))))))


;; 判断两个set是否相等
(define eqset?
    (lambda (set1 set2)
        (cond ((subset? set1 set2)
                (subset? set2 set1))
              (else #f))))

;; 判断两个set有没有交集
(define intersect?
    (lambda (set1 set2)
        (cond ((null? set1) #f)
              ((member? (car set1) set2) #t)
              (else
                (intersect? (cdr set1) set2)))))

;; 寻找两个set的交集
(define intersect
    (lambda (set1 set2)
        (cond ((null? set1) nil)
              ((member? (car set1) set2)
                (cons (car set1)
                      (intersect? (cdr set1) set2)))
              (else
                (intersect (cdr set1) set2)))))
;; 求两个set的并集
(define union
    (cond ((null? set1) set2)
          ((member? (car set1) set2)
            (union (cdr set1) set2))
          (else
            (cons (car set1)
                  (union (cdr set1) set2)))))

;; 求所有set1中的在set2中不存在的元素
(define xxx
    (cond ((null? set1) nil)
          ((member? (car set1) set2)
            (xxx (cdr set1) set2))
          (else
            (cons (car set1)
                  (xxx (cdr set1) set2)))))


;; 求一个层次性set中所有子set的重复的元素
(define intersectall
    (lambda (l-set)
        (cond ((null? (cdr l-set)) (car l-set))
              (else
                (intersect (car l-set))
                           (intersectall (cdr l-set))))))

(define a-pair?
    (lambda (x)
        (cond ((atom? x) #f)
              ((null? x) #f)
              ((null? (cdr x) #f)
              ((null? (cddr x) #t)
              (else #f))))))

(define first
    (lambda (p)
        (cond
          (else (car p)))))
(define second
    (lambda (p)
        (cond
          (else (cadr p)))))
(define build
    (lambda (s1 s2)
        (cond
          (else (cons s1
                      (cons s2 nil))))))

(define fun?
    (lambda (rel)
        (set? (fisrts rel))))
;; a finite function is a list of pairs in which no first element of any pair is
;; the same as any other first element

;; 层次性set，翻转每个子set
(define revrel
    (lambda (rel)
      (cond ((null? rel) nil)
            (else
              (cons (build (second (car rel))
                           (first (car rel))))
                    (revrel (cdr rel))))))

(define seconds
    (lambda (lat)
        (cond ((null? lat) nil)
              ((atom? (car lat)
                (seconds (cdr lat)))
              (else
                (cons (cadr (car lat))
                      (seconds (cdr lat))))))))

(define fullfun?
    (lambda (fun)
        (set? (seconds fun))))

(define one-to-one
    (lambda (fun)
        (fun? (revrel fun))))
