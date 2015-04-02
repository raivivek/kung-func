#lang planet neil/sicp

(define (smallest-divisor n) (find-divisor n 2))
(define (divides? a b) (= (remainder b a) 0))
(define (square n) * n n)

(define (next n)
  (if (= n 2) 3 (+ 2 n)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (prime? n)
  (= n (smallest-divisor n)))


; TODO on previous exercise is fixed.
