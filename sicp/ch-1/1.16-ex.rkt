#lang planet neil/sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

; Using the observation (b^n/2)^2 = (b^2)^n/2 :
; we maintain the current value inside the brackets in variable b,
; the exponent in n, and any extra b's that we need to multiply
; to get an even exponent in s.
(define (fast-expt-iter b n s)
    (cond ((= n 0) s)
        ((even? n) (fast-expt-iter (* b b) (/ n 2) s))
        (else (fast-expt-iter (* b b) (/ (dec n) 2) (* s b)))))
