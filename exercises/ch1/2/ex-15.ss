;; sine of an angle
; If sufficiently small, sin x = x
; Else, sin x = 3(sin(r/3)) - 4(sin^3(r/3))

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

; a. How many times is `p` applied when (sine 12.15)
; 1. (p (sine (/ 12.15 3))) -> (p (sine 4.05))
; 2. (p (p (sine 1.35)))
; 3. (p (p (p (sine 0.45))))
; 4. (p (p (p (p (sine 0.15)))))
; 5. (p (p (p (p (p (sine 0.05))))))
;    (p (p (p (p (p 0.05)))))
; b. What is space and time complexity after applying (sine a). Expanding =>
; Since we are dividing by 3 each time, we are effectively computing by the log
; base 3 algorithm, which is just O(log x)
