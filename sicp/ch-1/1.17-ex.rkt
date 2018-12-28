#lang planet neil/sicp

(define (double n) (+ n n))

(define (halve n)
  (cond ((even? n) (/ n 2))
        (else (/ (dec n) 2))))

(define (multiply a b)
  (multiply-iter a b 0))

; clearly, this program is analgous to ex 1.16 and uses a logrithmic
; number of steps to compute a * b.
; A rough proof:
; Say a * b, where b is even
; 1 step  =  2*a    = 2^1*a
; 2 step  =  4*a    = 2^2*a
; 3 step  =  8*a    = 2^3*a
; ..
; n step  =  b*a    = 2^n*a
;
; 2^n = b
; n = O(log b)
; i.e., Number of steps is of logarithmic order of b.
(define (multiply-iter a b n)
  (cond ((= b 0) a)
        ((even? b) (multiply-iter (double a) (halve b) n))
        (else (multiply-iter (double a) (halve b) (+ n a)))))


; NOTE: We are ignoring here the internal complexity of computing the
; multiplication itself. That implementation is implementation specific and is
; usually done using Karatsuba Algorithm.
; Here, we are just reducing the number of steps required.
