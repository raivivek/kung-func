#lang planet neil/sicp

(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 109)
(timed-prime-test 1021)
(timed-prime-test 10039)
(timed-prime-test 100043)
(timed-prime-test 1000039)
(timed-prime-test 10000103)
(timed-prime-test 100000039)
(timed-prime-test 1000000021)
;(timed-prime-test 10000000061)
;(timed-prime-test 100000000057) 
;(timed-prime-test 1000000000039)
