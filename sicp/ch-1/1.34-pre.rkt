#lang planet neil/sicp

; lambda abstraction
(define (f x y)
  ((lambda (a b)
  (+ (* x (square a))
     (* y b)
     (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

; let abstraction
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

; As can be seen from the above example, the let construct is nothing but
; a syntactic sugar for lambda construct and can be readily converted to
; original form.

; (let ((⟨var 1 ⟩ ⟨exp 1 ⟩)
;       (⟨var 2 ⟩ ⟨exp 2 ⟩)
;       ...
;       (⟨var n ⟩  ⟨expn ⟩))
;    ⟨body⟩)

; converts to,

; ((lambda (⟨var 1 ⟩ . . . ⟨var n ⟩)
;      ⟨body⟩)
;  ⟨exp 1 ⟩
;  ...
;  ⟨expn ⟩)

; The former example makes it easier to follow the direct relation between
; the variables and their corresponding definitions.
