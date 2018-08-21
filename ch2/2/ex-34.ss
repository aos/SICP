; Exercise 2.34
; Horner's rule
; Evaluating polynomials in the form:
; (a_n)(x^n) + (a_n-1)(x^n-1) + ... + a₁x + a₀
; Using Horner's rule it becomes:
; (...((a_n)x + a_n-1)x + ... + a₁)x + a₀

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate
    (lambda (this-coeff higher-terms)
      (+ this-coeff
         (* x higher-terms)))
    0
    coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))

; For (1 + 3x + 0x^2 + 5x^3 + 0x^4 + 1x^5)
; 1 + (((((1 + 0)x + 0)x + 5)x + 0)x + 3)x

; Changing this to prefix notation:
(define (horner x)
  (+ 1 (* x (+ 3 (* x (+ 0 (* x (+ 5 (* x (+ 0 (* x (+ 1 0))))))))))))
