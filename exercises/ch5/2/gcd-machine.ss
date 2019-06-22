; GCD machine

(define gcd-machine
  (make-machine
    (list
      (list 'rem remainder)
      (list '= =)
      (list 'read read)
      (list 'print write-line)) ; (table of) operations
    '(controller
        (assign a (op read))
        (assign b (op read))
      test-b ; controller
        (test (op =) (reg b) (const 0))
        (branch (label gcd-done))
        (assign t (op rem) (reg a) (reg b))
        (assign a (reg b))
        (assign b (reg t))
        (goto (label test-b))
      gcd-done
        (perform (op print) (reg a)))))

; sets register contents params: machine, register, value
;(set-register-contents! gcd-machine 'a 206)
;(set-register-contents! gcd-machine 'b 40)
;
;(start gcd-machine)
;
;(get-register-contents gcd-machine 'a)
