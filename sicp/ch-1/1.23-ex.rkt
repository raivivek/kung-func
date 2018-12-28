#lang planet neil/sicp

(define (smallest-divisor n) (find-divisor n 2))
(define (divides? a b) (= (remainder b a) 0))
(define (square n) (* n n))

(define (next n)
  (if (= n 2) 3 (+ 2 n)))

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

; We can observe from the runtime of previous program that using (next test-divisor)
; results in a runtime mprovement of 1.6 times approximately.
;
; The observed difference can be explained on the basis of extra overhead of a
; procedure call. While addition can be natively computed by the CPU, calling
; and executing a procedure does takes some time.
(search-for-primes 100 3)
(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)
