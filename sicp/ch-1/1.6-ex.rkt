#lang planet neil/sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

; This does not work because of the fact that new-if is a Scheme procedure
; which follows the applicative method of evaluation i.e., the all arguments to
; the procedure are evalauted first. This causes the program to run in infinite
; loop.
; That's why `if` needs to be defined as a special language construct.
