#lang planet neil/sicp

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; In applicative order, the interpreter ﬁrst evaluates the operator and
; operands and then applies the resulting procedure to the resulting arguments.
;
; In this case, the given example will result in infinite expansion
; (test 0 (p)) ; evaluates (p)
; (test 0 (p))
; (test 0 (p))
; ...
;
;
; While normal order of evaluation doesn't evaluate the operands until
; their values are actually needed. In this case:
; (test 0 (p))
; (if (= 0 0) 0 (p)) ; predicate is evaluated first
; 0
