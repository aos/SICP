; GCD machine

(define gcd-machine
  (make-machine
    '(a b t) ; register names
    (list (list 'rem remainder) (list '= =)) ; (table of) operations
    '(test-b ; controller
        (test (op =) (reg b) (const 0))
        (branch (label gcd-done))
        (assign t (op rem) (reg a) (reg b))
        (assign a (reg b))
        (assign b (reg t))
        (goto (label test-b))
      gcd-done)))

; sets register contents params: machine, register, value
(set-register-contents! gcd-machine 'a 206)
(set-register-contents! gcd-machine 'b 40)

(start gcd-machine)

(get-register-contents gcd-machine 'a)
