; Finding roots of equations by the half-interval method
; Given points 'a' and 'b' such that 'f(a) < 0 < f(b)', then 'f' must have at
; least one zero between 'a' and 'b'.
; To locate the zero:
; 1. Let 'x' be the average of 'a' and 'b' and calcuate 'f(x)'
; 2. If 'f(x) > 0', 'f' must have a zero between 'a' and 'x'
; 3. If 'f(x) < 0', 'f' must have a zero between 'x' and 'b'
; 4. Continue to identify smaller intervals until it is small enough (using an
; error tolerance)
(define (search f neg-point pos-point)
  (define (close-enough? x y)
    (< (abs (- x y)) 0.001))
  (define (average x y) (/ (+ x y) 2))
  (let ((midpoint
          (average neg-point pos-point)))
        (if (close-enough? neg-point pos-point)
            midpoint
            (let ((test-value (f midpoint)))
              (cond
                ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))


(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value)
                (positive? b-value))
           (search f a b))
          ((and (negative? b-value)
                (positive? a-value))
           (search f b a))
          (else
            (error "Values are not of opposite sign" a b)))))

;; Approximate π as the root between 2 and 4 of 'sin x = 0':
(half-interval-method sin 2.0 4.0)

; Find the root of the equation 'x³ - 2x - 3 = 0' between '1' and '2':
(half-interval-method
  (lambda (x) (- (* x x x) (* 2 x) 3))
  1.0
  2.0)
