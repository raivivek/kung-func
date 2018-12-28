#lang planet neil/sicp

(define (f g) (g 2))

; (f square)
; 4
; (f (lambda (z) (* z (+ z 1))))
; 6

; (f f)
; (f 2)
; (2 2)
; Arguments error, no procedure supplied; 2 can not be applied to 2.
