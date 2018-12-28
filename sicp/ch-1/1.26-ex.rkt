#lang planet neil/sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))

; In the other example of exp-mod, the process was linear recursive while this
; is a tree-recursive process. Since complexity of tree-recursive processes is
; of exponential order (O(2^n))but at the same time the number of elements here
; is of lograthimic order (O(log n))(due to halving of exponent each time), the
; overall complexity becomes O(n).
