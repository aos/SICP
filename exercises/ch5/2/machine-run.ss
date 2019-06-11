; Run this GCD machine

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      #f))

(load "machine-model.ss")
(load "machine-assembler.ss")
(load "machine-execution-procs.ss")

(display (load "gcd-machine.ss")) ; 2
(display (load "ex-7.ss")) ; 100
