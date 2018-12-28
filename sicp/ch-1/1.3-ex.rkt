#lang planet neil/sicp

(define (square x) (* x x))

(define (sum-of-squares x y)
  (* (square x) (square y)))

(define (square-bigger-two x y z)
  (cond ((>= x y) (sum-of-squares x
                                  (if (>= y z) y z)))
        (else (sum-of-squares y
                              (if (>= x z) x z)))))
