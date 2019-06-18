; Run this GCD machine

(load "machine-model.ss")
(load "machine-assembler.ss")
(load "machine-execution-procs.ss")

;(display (load "gcd-machine.ss")) ; 2
;(display (load "ex-7.ss")) ; 100
(load "ex-18.ss")

(load "fib-machine.ss")
;(load "../1/fact-machine.ss")

(trace-on-register fib-machine 'val)
(trace-off-register fib-machine 'val)
