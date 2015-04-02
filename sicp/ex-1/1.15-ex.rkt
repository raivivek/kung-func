#lang planet neil/sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; linear recursive process
; the procedure terminates when angle is < 0.1 otherwise the value is reduced
; to one third each time.
;
; a) no. of steps: 12.15 / (3n) = 0.1 => n = 12.15/0.3 ~ 41 steps
; b) Linear growth order, linear order space

