; Exercise 2.77
; Trying to evaluate the expression '(magnitude z)', where z = 3 + 4i
; z = (make-from-real-imag 3 4)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        ;; 'apply' -> takes 2 arguments, a procedure and a list
        ;; applies the procedure on the list
          (apply proc (map contents args))
          (error
            "No method for these types:
            APPLY-GENERIC"
            (list op type-tags))))))

; This works because we expose the internal procedures: real-part, imag-part and
; angle and tag them as 'complex' numbers. Then, we will look in the complex
; column for these specific types of #s.

; (magnitude z) -> (magnitude (make-from-real-imag 3 4))
; (magnitude '(complex rectangular 3 . 4))
; (apply-generic 'magnitude '(complex rectangular 3 . 4))
; (apply (get 'magnitude '(complex)) (contents '(complex rectangular 3 . 4)))
; (apply magnitude '(rectangular 3 . 4)) -> (magnitude '(rectangular 3 . 4))
; (apply-generic 'magnitude '(rectangular 3 . 4))
; (apply (get 'magnitude '(rectangular)) (contents '(rectangular 3 . 4)))
; (apply magnitude '(rectangular 3 . 4)) -> (magnitude '(3 . 4))
; (apply (lambda (z)
;           (sqrt (+ (square (real-part z))
;                    (square (imag-part z))))) '(3 . 4))

; 'apply-generic' is called twice. Once to obtain the complex package procedure
; and once to obtain the rectangular package procedure. Whew.
