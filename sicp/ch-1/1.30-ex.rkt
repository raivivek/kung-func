#lang planet neil/sicp

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

; TEST
(define (cube n) (* n n n))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

(check-expect (sum-cubes 1 3) 36)
