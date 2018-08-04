#lang sicp
(#%require "fast-expt.scm")

(define (expmod base exp m)
    (remainder (fast-expt base exp) m))


;; Alyssa的算法在数比较小的时候可以计算，但是如果要检测非常大的数，就会超过计算机的限制
;; 造成溢出，而书上34页的expmod函数，每次都对这一次的计算结果进行remainder计算，是的将
;; 乘幂控制在一定的范围内，这样能够避免溢出的产生
