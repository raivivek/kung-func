#lang planet neil/sicp

(define (square x) * x x)

(define (fib n)
  (fib-iter 1 0 0 1 n))

; we have T_pq = (a, b) -> (aq+bq+ap, bp+aq)
; applying this transformation twice and bringing the variable in the format of
; T_pq transformation, we have
; T_p'q' = (a, b) -> (aq'+bq'+ap', bp'+aq') where q' = (2pq+q^2),
;                                                 p' = (p^2+q^2)
;
; essentially, we are computing T^n exactly as we did in the fast-expt method
; previous exercises. It's just in case of T here, squaring T isn't simply T*T,
; rather T -> T = T'; as calculated above.

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p)
                      (square q))
                   (+ (* 2 p q)
                      (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
