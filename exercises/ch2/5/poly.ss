; Symbolic Algebra

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

; Assume we have selectors to extract from 'poly':
; 'variable'
; 'term-list'

; Polynomial addition
(define (add-poly p1 p2)
  (if (same-variable? (variable p1)
                      (variable p2))
      (make-poly
        (variable p1)
        (add-terms (term-list p1)
                   (term-list p2)))
      (error "Polys not in same var:
             ADD-POLY"
             (list p1 p2))))

; Polynomial multiplication
(define (mul-poly p1 p2)
  (if (same-variable? (variable p1)
                      (variable p2))
      (make-poly
        (variable p1)
        (mul-terms (term-list p1)
                   (term-list p2)))
      (error "Polys not in same var:
             MUL-POLY"
             (list p1 p2))))
