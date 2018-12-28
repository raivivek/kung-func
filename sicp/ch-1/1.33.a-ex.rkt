#lang planet neil/sicp

(define (square n) (* n n))
(define (inc n) (+ n 1))

; linear recursive process, filtered accumulator
(define (filtered-accumulate combiner filter null-value term a next b)
  (if (> a b)
    null-value
    (if (filter a)
        (combiner (term a)
                (filtered-accumulate combiner filter null-value term (next a) next b))
        (filtered-accumulate combiner filter null-value term (next a) next b))))

; test for primality
(define (find-divisor n test-divisor)
  (define (divides? a b) (= (remainder b a) 0))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (define (smallest-divisor n) (find-divisor n 2))
  (and (= n (smallest-divisor n))
       (> n 1)))

; create sum of prime square from accumulator
(define (sum-prime-squares a b)
  (filtered-accumulate + prime? 0 square a inc b))

; TEST
(check-expect (sum-prime-squares 1 5) 38)
(check-expect (sum-prime-squares 1 10) 87)
