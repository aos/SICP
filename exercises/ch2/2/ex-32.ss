; Exercise 2.32
; Subsets

; For example:
; A set: (1 2 3)
; Set of all subsets:
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

(define nil '())

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map 
                       (lambda (x)
                         (append (list (car s)) x))
                       rest)))))

; Why this works
; At each recursion, we take the 'cdr' of the set, until we hit rock bottom
; 'nil'. Then we start to build from 'nil'. The first meaningful call of 'rest'
; will return 'nil', mapping it to '(3)' which returns '(() (3))' which becomes
; our next 'rest' passing it into '(2 3)'. At this point, we map over '(() (3))'
; with '(car (list 2 3))', which is 2 which will return to us '(2) (2 3)'. This
; becomes the result of our next rest once appended to the earlier 'rest':
; Here we now have '(() (3) (2) (2 3))' as our rest, the first item in our set
; is now '(1)'. Mapping this part over our rest gives us: 
; '((1) (1 3) (1 2) (1 2 3))'

; Starting from bottom to top, at base case of proc:
; Final => (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
; s = (1 2 3), (append (1) rest)
; rest = (() (3) (2) (2 3))
; s = (2 3), (append (2) (() (3))) => (append rest ((2) (2 3)))
; rest = (() (3))
; s = (3), (append (3) ()) => (() (3))
; rest = ()
; s = () <- go back up
