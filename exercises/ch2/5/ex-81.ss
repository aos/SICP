; Exercise 2.81
; 'apply-generic' may try to coerce arguments to each other's type even if they
; already have the same type

(define (scheme-number->scheme-number n) n)
(define (complex->complex z) z)

; 1. What happens if 'apply-generic' is called with 2 arguments of the same type
; for an operation that is not found in the table for those types?

(define (exp x y)
  (apply-generic 'exp x y))

; Add to scheme number package
(put 'exp
     '(scheme-number scheme-number)
     (lambda (x y)
       (tag (expt x y))))

; It would attempt to find this procedure using the type-tag of 'complex. It
; does not find it. So then it goes to see if it can coerce one type to another.
; It does this and re-tries 'apply-generic'.
; We would effectively enter an infinite loop since it will continue re-apply
; 'complex->complex' after not being able to find the procedure installed.

; 2. Did we need to add procedures for handling arguments of the same type?
; Nope. If the method exists, then it would find it. If the method does not
; exist, it would attempt to coerce but since it cannot find any coercion method
; it fails with no method found.

; 3. Modify 'apply-generic' so it doesn't try to coerce arguments of the same
; type

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                ; We exit early here if the types are equal
                ; There is no point in trying to coerce equal types
                (if (eq? type1 type2)
                    (error
                      "No method for these types"
                      (list op type-tags))
                    (let ((t1->t2
                            (get-coercion type1
                                          type2))
                          (t2->t1
                            (get-coercion type2
                                          type1)))
                      (cond (t1->t2
                              (apply-generic
                                op (t1->t2 a1) a2))
                            (t2->t1
                              (apply-generic
                                op a1 (t2->t1 a2)))
                            (else
                              (error
                                "No method for these types"
                                (list op type-tags)))))))
              (error
                "No method for these types"
                (list op type-tags)))))))
