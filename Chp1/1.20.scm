;; 欧几里得算法，又叫辗转相除法
(define (gcd a b)
    (if (= b 0)
          a
        (gcd b (remainder a b))))

;; 正则序
(gcd 206 40)
(gcd 40 (remainder 206 40)
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
...

;; 应用序
(gcd 204 40)
(gcd 6 4)
(gcd 4 2)
(gcd 2 0)
2
