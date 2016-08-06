;; 欧几里得算法，又叫辗转相除法
(define (gcd a b)
    (if (= b 0)
          a
        (gcd b (remainder a b))))
