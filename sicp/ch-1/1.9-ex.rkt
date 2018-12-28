#lang planet neil/sicp

; (+ 4 5)
; (if (= 4 0) 5 (inc (+ (dec 4) 5)))
; (if (= 4 0) 5 (inc (+ 3 5)))
; (if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (+ (dec 3) 5)))))
; (if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (+ 2 5)))))
; ...
; clearly, recursive process
; inc is the deferred operation that will be performed once the
; process starts shriking back. Here, the interpreter needs to keep
; track of the operations to be performed on the results and hence
; needs to keep track of all the lines;
(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))

; (+ 4 5)
; (if (= 4 0) 5 (+ (dec 4) (inc 5)))
; (if (= 4 0) 5 (+ 3 6)))
; (if (= 4 0) 5 (if (= 3 0) 6 (+ (dec 3) (inc 6)))
; (if (= 4 0) 5 (if (= 3 0) 6 (+ 2 7)))
; ...
; clearly, iterative process
(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))
