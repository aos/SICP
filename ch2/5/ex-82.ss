; Exercise 2.82
; Generalize 'apply-generic' to handle coercion in the general case of multiple
; arguments

; Strategy:
; Coerce all arguments to the type of the first argument
; If not possible, then... the second
; etc...

(define (apply-generic op . args)
  ; Coerces a list to a type
  (define (coerce-list-to-type lst type)
    (if (null? lst)
        '()
        (let ((t1->t2 (get-coercion (type-tag (car lst)) type)))
          (if t1->t2
              (cons (t1->t2 (car lst)) (coerce-list-to-type (cdr lst) type))
              (cons (car lst) (coerce-list-to-type (cdr lst) type))))))
  
  ; Applying to a list of multiple arguments
  (define (apply-coerced lst)
    (if (null? lst)
        (error "No method for given arguments")
        (let ((coerced-list (coerce-list-to-type args (type-tag car lst))))
          (let ((proc (get op (map type-tag coerced-list))))
            (if proc
                (apply proc (map contents coerced-list))
                (apply-coerced (cdr lst)))))))
  
  ; Logic to prevent always coercing if there is already direct input entry
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (apply-coerced args)))))
