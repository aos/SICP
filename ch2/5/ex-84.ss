; Exercise 2.84
; Modify 'apply-generic' with 'raise' so that it coerces its arguments to have
; the same type by successive raising

(define (apply-generic op . args)
  ; Coerces a list to a type
  (define (coerce-list-to-type lst type)
    (if (null? lst)
        '()
        (let ((t1->t2 (raise (car lst))))
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

; Type heirarchy (tower)
(define type-tower '(integer rational real complex))

; Test which is higher in tower
(define (find-highest-type args)
  (let ((type1-tier (memq t1 type-tower))
        (type2-tier (memq t2 type-tower)))
    ))

; 'raise'
(define (raise num)
  (let ((supertypes (memq (type-tag obj) type-tower)))
    (if (and supertypes (>= (length supertypes) 2))
        ((get-coercion (type-tag obj) (cadr supertypes)) obj)
        #f)))
