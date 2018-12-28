#lang planet neil/sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; b is always added to the value of a
; (a-plus-abs-b 10 2)
; > 12
; (a-plus-abs-b 10 -2)
; > 12
