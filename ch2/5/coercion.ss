; Coercion
; Viewing objects of one type as being of another type

; For example, we can transform a given ordinary # to a complex number with that
; real part and zero imaginary part
(define (scheme-number->complex n)
  (make-complex-from-real-imag
    (contents n) 0))

; Then install the procedures in a special coercion table,
; indexed under the names of the two types
(put-coercion 'scheme-number 'complex
              scheme-number->complex)

; Define new 'apply-generic'
; 1. Check whether the operation is defined for the arguments' types
; 2. If not, try coercion
; 3. Check coercion table to see if objects of 1st type can be coerced into 2nd
; 4. If not, check coercion table for 2nd object type to 1st
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
                            (list op type-tags))))))
              (error
                "No method for these types"
                (list op type-tags)))))))
