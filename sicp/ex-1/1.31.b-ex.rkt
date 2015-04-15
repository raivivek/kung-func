#lang planet neil/sicp

; iterative process
(define (product term a next b)
  (define (iter a result)
    (if (a > b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1)

(define (factorial n)
  (define (next t) (+ 1 t))
  (define (term t) (if  (= t 0) 1 t))
  (product term 0 next n))

; TEST
(check-expect (factorial 0) 1)
(check-expect (factorial 1) 1)
(check-expect (factorial 10) 3628800)
