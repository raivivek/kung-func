#lang planet neil/sicp

(define (cont-frac n d k)
  (cond ((= k 1) (/ (n k) (d k)))
        (else
          (/ (n k) (+ (d k) (cont-frac n d (- k 1)))))))

; for k > 10, we can get accuracy up to four decimal places

(define k 10)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

; as can be seen that the procedure is called in a nested manner, the program
; evaluates in a linear recursive process (unfolds then folds).


; iterative version here

(define (cont-frac-iterative n d k)
  (define (cont-frac-iter k sum)
    (cond ((= k 1) (/ (n k) (+ (d k) sum)))
            (else
            (cont-frac-iter n d (- k 1) (/ (n k) (+ sum (d k)))))))
  (cont-frac-iter k 0))
