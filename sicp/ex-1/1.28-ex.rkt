#lang planet neil/sicp

(define (square n) (* n n))

(define (expmod base exp m)
  (define (square-and-check x)
    (define (square-check-cond x square)
      (if (and (= square 1)
               (not (= x 1))
               (not (= x (- m 1))))
        0
        square))
    (square-check-cond x (remainder (square x) m)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square-and-check (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (check-output x)
    (and (not (= x 0)) (= x 1)))
  (define (try-it a)
    (check-output (expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(timed-prime-test 2)  ; true
(timed-prime-test 7)  ; true
(timed-prime-test 37) ; true
(timed-prime-test 39) ; false

(timed-prime-test 561)  ; false ; Carmichael number
(timed-prime-test 1105) ; false ; Carmichael number
(timed-prime-test 1729) ; false ; Carmichael number
(timed-prime-test 6601) ; false ; Carmichael number
