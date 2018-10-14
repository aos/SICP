; Exercise 2.79
; Define a generic equality predicate 'equ?' that tests the equality of two
; numbers, and install it in the generic arithmetic package.
; This operation should work for ordinary, rational, and complex numbers.

(define (equ? num1 num2)
  (apply-generic 'equ? num1 num2))

(define (install-equ?-package)
  (put 'equ? ('scheme-number 'scheme-number)
       (lambda (x y) (= x y)))
  (put 'equ? ('rational 'rational)
       (lambda (x y)
         (and (= (numer x) (numer y))
              (= (denom x) (denom y)))))
  (put 'equ? ('complex 'complex)
       (lambda (x y)
         (and (= (real-part x) (real-part y))
              (= (imag-part x) (imag-part y)))))
  'done)
