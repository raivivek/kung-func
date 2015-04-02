#lang planet neil/sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; normal order evaluation:
; gcd(206, 40)
; gcd(40, remainder (206, 40))
; gcd(remainder(206, 40), remainder(40, remainder(206, 40)))
; gcd(remainder(40, remainder(206, 40)),
;     remainder(remainder(206, 40), remainder(40, remainder(206, 40))))
; .. one more step
;
; Total remainder operations = 7 (to compute if predicate) + 4 (to compute
; return value) = 11

; applicative order:
; gcd(206, 40)
; gcd(40, 6)
; gcd(6, 4)
; gcd(4 2)
; gcd(2, 0)
; 2
;
; Total remainder operations = 4
