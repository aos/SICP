; Constructing procedures using Lambda

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

; We could do the same with our integral procedure
(define (integral f a b dx)
  (* (sum f (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
     dx))

; Lambdas are essentially nameless procedures
; And like any expression that has a procedure as its value, lambda expressions
; can be used as the operator in a combination
((lambda (x y z) (+ x y (square z))) 1 2 3)

; Using 'let' to create local variables
; Example function: 'f(x, y) = x(1 + xy)² + y(1 - y) + (1 + xy)(1 - y)'
; Could also be expressed as:
; 'a = 1 + xy', 'b = 1 - y', 'f(x, y) = xa² + yb + ab'

; When writing a procedure, we would like to include as local variables not only
; 'x' and 'y' but also the names of intermediate quantities like 'a' and 'b'.
; This can be accomplished one way using an aux procedure:
(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

; Now using a 'lambda' expression which gives us a single call:
(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

; There is a special form called 'let' to make its use more convenient
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

; General form of 'let':
; (let ((<var 1> <exp 1>)
;       (<var 2> <exp 2>)
;       ...
;       (<var n> <exp n>))
;   <body>)

; Local binding of variables:
(define (loc1 x)
  (+ (let ((x 3))
       (+ x (* x 10))) ; This evaluates to 33
     x))

(loc1 5) ; => 33 + 5 = 38

; The variables' values are computed outside the 'let'
(define (loc2 x)
  (let ((x 3)
        (y (+ x 2))) ; This 'x' is not local and is pulled from outside scope
    (* x y)))

(loc2 2) ; => 3 * (2 + 2)
