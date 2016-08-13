#### Reference
>1. [WIKI:Church encoding](https://en.wikipedia.org/wiki/Church_encoding#Computation_with_Church_numerals)
2. [WIKI:丘奇数](https://zh.wikipedia.org/wiki/%E9%82%B1%E5%A5%87%E6%95%B0)
3. [逐步理解丘奇数(一)](https://pfmiles.wordpress.com/2009/11/12/%E9%80%90%E6%AD%A5%E7%90%86%E8%A7%A3%E4%B8%98%E5%A5%87%E6%95%B0%E4%B8%80/)
4. [λ演算](https://zh.wikipedia.org/wiki/%CE%9B%E6%BC%94%E7%AE%97)
5. [sicp-ex-2.6](http://community.schemewiki.org/?sicp-ex-2.6)

#### 丘奇数表示```zero```，```one```，```two```  

* 对0的定义，可以看做对一个输入函数```f```，返回他的初始值
```scheme
(define zero
  (lambda (f) (lambda (x) x)))
```
* 对```+ 1```的定义
```scheme
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
```
* 对1的推导
```scheme
(define one
  (lambda (f) (lambda (x) (f x))))
  (add-1 zero)
  (lambda (f) (lambda (x) (f ((zero f) x))))
  ;; zero is a function of one arg, that returns a function of one arg that returns the argument (identity function)
  ;; ((zero f) x) is just x
  => (lambda (f) (lambda (x) (f x)))
```
* 对2的推导
```scheme
(define two
  (lambda (f) (lambda (x) (f (f x)))))
  (add-1 one)
  (lambda (f) (lambda (x)  (f ((one f)) x)))
   => (lambda (f) (lambda (x) (f (((lambda (a) (lambda (b) (a b))) f) x))))
   => (lambda (f) (lambda (x) (f ((lambda (b) (f b)) x))))
   => (lambda (f) (lambda (x) (f (f x))))
   => (lambda (f) (lambda (x) (f (f x))))
```  

#### 举例
zero，one和two的定义都是对一个输入函数```f```进行处理的过程，可以理解为零，一，二的函数表现形式，如：
```scheme
(define (inc n)
   (+ n 1))
]=> ((zero inc) 0)
;Value:0
]=> ((zero inc) 1)
;Value:1
]=> ((one inc) 1)
;Value:2
]=> (((add-1 one) inc) 1)
;Value:3
```  
又如：
```scheme
1 ]=> ((one square) 2)

;Value: 4

1 ]=> ((two square) 2)

;Value: 16

1 ]=> (((add two one) square) 2)

;Value: 256

1 ]=>
```  
