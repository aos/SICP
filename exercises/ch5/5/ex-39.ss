; Exercise 5.39
; lexical-address-lookup and set!
; two arguments: (lexical address), run-time environment
; returns: value of variable stored at location

; in the example:
((lambda (x y)
   (lambda (a b c d e)
     ((lambda (y z) (* x y z))
      (* a b x)
      (+ c d x))))
 3
 4)

; while we are evaluating (* x y z), our environment would
; look something like this, depending on what we applied:
(define my-env
  (list (cons '(y z) '((* a b x) (+ c d x))) ; inner-most frame
        (cons '(a b c d e) '(1 2 3 4 5)) ; one frame out -- this gets applied
        (cons '(x y) '(3 4)))) ; outer-most frame

; addr -> (2 . 0) (frame-number . offset)
(define (lex-address frame-num offset)
  (cons frame-num offset))
(define (addr-frame address) (car address))
(define (addr-offset address) (cdr address))

; 1. lookup
(define (lexical-address-lookup addr env)
  (let ((f-num (addr-frame addr))
        (offset (addr-offset addr)))
    (let ((frame (list-ref env f-num)))
      (let ((value (list-ref (frame-values frame)
                             offset)))
        (if (eq? value '*unassigned*)
            (error "Unassigned value for variable")
            value)))))

; 2. lexical-address-set!
; given addr (2 . 0), value
(define (lexical-address-set! addr value env)
  (let* ((f-num (addr-frame addr))
         (offset (addr-offset addr))
         (frame (list-ref env f-num))
         (vals (frame-values frame)))
    (set-car! (list-tail vals value))))
