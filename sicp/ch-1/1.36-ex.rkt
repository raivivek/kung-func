#lang planet neil/sicp

(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; terminates on 35th iteration
(define (x-power-x n)
  (fixed-point (lambda (x) (/ (log n) (log x))) 2.0))

; terminates on 10th iteration
(define (x-power-x-damped n)
  (fixed-point (lambda (x) (average x (/ (log n) (log x))) 2.0)))

(x-power-x 1000)
(x-power-x-damped 1000)
