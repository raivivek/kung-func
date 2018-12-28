#lang planet neil/sicp

; Simpson's Rule
; According the ideas given in the chapter, we will try to use the higher order
; summation abstraction to obtain the result.
;
; f    -> Function which generates the terms of sequence
; next -> Will process the arguments given to f
; a, b -> Constants
; n    -> Termination condition
;
; Note that `next` doesn't denote the next term in sequence, instead
; (f (next args)) is the next term.

(define (simpson function a b n)
  (define h (/ (- b a)
                 n))
  (define (next t)
    (+ t h))
  (define (coefficient k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))
  (define (sum a k)
    (if (> k n)
      0
      (+ (* (coefficient k) (function a))
         (sum (next a) (+ k 1)))))
  (/ (* h (sum a 0))
     3))

(define (cube x) (* x x x))
(simpson cube 0 1 100)     ; 1/4


; Clearly, simpson's rule calculate the result to be exact 1/4
