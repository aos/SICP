; Data-directed programming
; Assume we have two procedures 'put' and 'get' for manipulating the
; operation-and-type table

; (put <op> <type> <item>) -- installs the <item> in the table, indexed by <op>
; and the <type>

; (get <op> <type>) -- looks up the <op>, <type> entry in the table and returns
; the item found there. If no item is found, 'get' returns false

; Ben's package
(define (install-rectangular-package)
  ;; internal procedures
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (magnitude z)
    (sqrt (+ (square (real-part z))
             (square (imag-part z)))))
  (define (angle z)
    (atan (imag-part z) (real-part z)))
  (define (make-from-real-imag x y)
    (cons x y))
  (define (make-from-mag-ang r a)
    (cons (* r (cos a)) (* r (sin a))))
  ;; interface to the rest of the system
  (define (tag x)
    (attach-tag 'rectangular x))
  (put 'real-part '(rectangular) real-part)
  (put 'imag-part '(rectangular) imag-part)
  (put 'magnitude '(rectangular) magnitude)
  (put 'angle '(rectangular) angle)
  (put 'make-from-real-imag 'rectangular
       (lambda (x y)
         (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rectangular
       (lambda (r a)
         (tag (make-from-mag-ang r a))))
  'done)

;; apply-generic
; Uses the dotted-tail notation 'op' as first argument, then a list of 'args'
; This is how we will access the table
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

;; Using apply-generic
(define (real-part z)
  (apply-generic 'real-part z))
(define (imag-part z)
  (apply-generic 'imag-part z))
(define (magnitude z)
  (apply-generic 'magnitude z))
(define (angle z)
  (apply-generic 'angle z))

; Extract from the table constructors to be used by the program
(define (make-from-real-imag x y)
  ((get 'make-from-real-imag
        'rectangular)
   x y))
(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang
        'polar)
   r a))
