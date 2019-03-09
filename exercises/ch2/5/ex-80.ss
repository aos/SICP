; Exercise 2.80
; Define a generic predicate '=zero?' that tests if its argument is zero
; ...and install it in generic package

(define (=zero? num)
  (apply-generic '=zero? num))

(define (install-zero?-package)
  (put '=zero? ('scheme-number)
       (lambda (x) (= x 0)))
  (put '=zero? ('rational)
       (lambda (x) (= (numer x) 0)))
  (put '=zero? ('complex)
       (lambda (x)
         (= (magnitude x) 0)))
  'done)
