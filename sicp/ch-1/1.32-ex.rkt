#lang planet neil/sicp

; linear recursive process
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

; sum
(define (sum term a next b)
  (accumulate + 0 term a next b))

; product
(define (product term a next b)
  (accumulate * 1 term a next b))

; TEST
;; sum
(define (cube n) (* n n n))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

(check-expect (sum-cubes 1 3) 36)

;; product
(define (factorial n)
  (define (next t) (+ 1 t))
  (define (term t) (if  (= t 0) 1 t))
  (product term 0 next n))

(check-expect (factorial 0) 1)
(check-expect (factorial 1) 1)
(check-expect (factorial 10) 3628800)
