; Exercise 2.83
; Add the 'raise' procedure for dealing with tower of types
; The tower (lowest -> highest):
; integer -> rational -> real -> complex
; Since we don't have a (clean) representation for irrational numbers, I chose
; to forego representation to real numbers and just go straight to complex

; Raises an object one level higher in the type heirarchy
(define (raise num)
  (define type-tower '(integer rational real complex))
  (let ((supertypes (memq (type-tag obj) type-tower)))
    (if (and supertypes (>= (length supertypes) 2))
        ((get-coercion (type-tag obj) (cadr supertypes)) obj)
        #f)))

(put-coercion 'integer 'rational
              integer->rational)
(define (integer->rational n)
  (make-rational (contents n) 1))

(put-coercion 'rational 'real
              rational->real)
(define (rational->real n)
  (let ((num (contents n)))
    (* (/ (numer num)
          (denom num))
       1.0)))

(put-coercion 'real 'complex
              real->complex)
(define (real->complex n)
  (make-complex-from-real
    (contents n) 0))
