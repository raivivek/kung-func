#lang planet neil/sicp

(define (smallest-divisor n) (find-divisor n 2))
(define (divides? a b) (= (remainder b a) 0))
(define (square n) * n n)

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime b elapsed-time)
  (display b)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes a b n)
  (search-prime-iter (if (even? a) (+ a 1) a)
                     (if (even? b) (- b 1) b)
                     0
                     (runtime)))

(define (search-prime-iter a b n start-time)
  (cond ((= n 3)
         (report-prime b (- (runtime) start-time)))
        (else
           (if (prime? a)
             (search-prime-iter (+ 2 a) b (+ 1 n) start-time)
             (search-prime-iter (+ 2 a) b n start-time)))))

; CAUTION: Don't know why this is taking linear computation time on my machine.
; Perhaps I have written the procedure in a way that has transformed it into
; a O(n) process from O(log n).
