#lang planet neil/sicp

; recursive
(define (recur-func n)
  (cond ((< n 3) n)
        (else (+ (recur-func (- n 1))
                 (* 2 (recur-func (- n 2)))
                 (* 3 (recur-func (- n 3)))))))

; itertive
; note that iter procedure contains the entire state of the program in the four
; parameters.
(define (iter-func n)
  (define (iter a b c counter)
    (cond ((< n 3) n)
          ((= n counter) (+ c
                            (* 2 b)
                            (* 3 a)))
          (else (iter c (* 2 b) (* 3 a) (+ counter 1)))))
  (iter 0 1 2 3)) ; n is within the block scope
