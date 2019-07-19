; Run exercise 5.50
(load "compile-go.ss")
(load "ex-50.ss")
(load "ex-50-ev-instructions.ss")

(define ev-machine
  (make-machine
    eceval-operations
    ev-instructions))

(set! the-global-environment (setup-environment))
(set-register-contents! ev-machine 'env the-global-environment)
(set-register-contents! ev-machine 'flag #f)
(start ev-machine)
