#lang planet neil/sicp

; Alyssa P. Hacker's code
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; She indeed is correct that this procedure will serve our purpose. But as mentioned
; in the text, using exp-mod version saves us from dealing with huge intermediate
; results during exponentiation.
; Although Scheme implements arbitrary precision arithmetic which can allow us
; to handle large numbers, it is not implemented native to the hardware and thus
; is very slow.
; Using exp-mod avoids this speed break by keeping the result below m.
