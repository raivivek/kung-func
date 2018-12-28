#lang planet neil/sicp

(define (smallest-divisor n) (find-divisor n 2))
(define (divides? a b) (= (remainder b a) 0))
(define (square n) (* n n))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes a n)
  (search-prime-iter (if (even? a) (+ a 1) a)
                     0))

(define (search-prime-iter a n)
  (cond ((= n 3)
         a)
        (else
           (if (timed-prime-test a)
             (search-prime-iter (+ 2 a) (+ 1 n))
             (search-prime-iter (+ 2 a) n )))))

; we can clearly observe that the runtimes between successive procedure
; calls below has a ratio between 3 to 4 (factor of at least ~ sqrt(10))
(search-for-primes 100 3)
(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)
(search-for-primes 10000000000 3)
(search-for-primes 100000000000 3)
