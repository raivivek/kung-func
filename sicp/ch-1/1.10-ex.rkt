#lang planet neil/sicp

; Ackermann's function
(define (ack x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (ack (- x 1) (ack x (- y 1))))))

; (ack 1 10)
; 1024
; (ack 2 4)
; 65536
; (ack 3 3)
; 65536


; calculates 2*n
(define (f n) (A 0 n))

; calculates 2^n
(define (g n) (A 1 n))

; calculates 2^(2^(2^(2^(...))))
;            <-    n times    ->
(define (h n) (A 2 n))

; calculates 5*n^2
(define (k n) (* 5 n n))
