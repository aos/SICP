; Exercise 2.6
; Church numerals

; Zero is defined as "zero" applications of 'f' on 'x'
(define zero (lambda (f) (lambda (x) x)))
; One is defined as one application of 'f' on 'x'
(define one (lambda (f) (lambda (x) (f x))))
; Two is defined as two applications of 'f' on 'x'
(define two (lambda (f) (lambda (x) (f (f x)))))

; The 'add-1' procedure takes in a church numeral and applies it to 'x'
(define (add-1 n)
  (lambda (f)
    (lambda (x) (f ((n f) x)))))

; Expansion of (add-1 zero)
(add-1 zero)
(add-1 (lambda (f) (lambda (x) x)))

(lambda (f)
  (lambda (x)
    (f ((lambda (x) x) x))))

; Converting to real numbers
(((lambda (f)
  (lambda (x)
    (f ((lambda (x) x) x)))) (lambda (x) (+ x 1))) 0)

; Expansion of (add-1 one)
(add-1 one)
(add-1 (lambda (f) (lambda (x) (f x))))

(lambda (f)
  (lambda (x)
    (f ((lambda (x) (f x)) x))))

; Converting it to real numbers
(((lambda (f)
    (lambda (x)
      (f ((lambda (x) (f x)) x)))) (lambda (x) (+ x 1))) 0)

; Effectively the same as
(((add-1 one) (lambda (x) (+ x 1))) 0)

; Expansion of (add-1 two)
(add-1 two)
(add-1 (lambda (f) (lambda (x) (f (f x)))))

(lambda (f)
  (lambda (x)
    (f ((lambda (x) (f (f x))) x))))

; Converting it to real numbers
(((lambda (f)
    (lambda (x)
      (f ((lambda (x) (f (f x))) x)))) (lambda (x) (+ x 1))) 0)

; Direct definition of the addition procedure
(define (add m n)
  (lambda (f)
    (lambda (x) (m ((n f) x)))))

(((add zero two) (lambda (x) (+ x 1))) 0)
