; Using the constraint system

(define C (make-connector))
(define F (make-connector))
(celsius-fahrenheit-converter C F) ; ok

(define (celsius-fahrenheit-converter c f)
  (let ((u (make-connecter))
        (v (make-connecter))
        (w (make-connecter))
        (x (make-connecter))
        (y (make-connecter)))
    (multiplier c w u)
    (multiplier v x u)
    (adder v y f)
    (constant 9 w)
    (constant 5 x)
    (constant 32 y)
    'ok))

(probe "Celsius temp" C)
(probe "Fahrenheit temp" F)

(set-value! C 25 'user)
; Probe: Celsius temp = 25
; Probe: Fahrenheit temp = 77

(set-value! F 212 'user) ; Error! Contradiction (77 212)
(forget-value! C 'user)
(set-value! F 212 'user)
; Probe: Fahrenheit temp = 212
; Probe: Celsius temp = 100
