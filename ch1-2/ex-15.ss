;; sine of an angle
; If sufficiently small, sin x = x
; Else, sin x = 3(sin(r/3)) - 4(sin^3(r/3))

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
