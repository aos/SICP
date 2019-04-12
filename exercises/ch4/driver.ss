; Driver loop

(load "syntax.ss")
(load "ds.ss")

(define apply-in-underlying-scheme apply)

(load "meta-circular.ss")
(load "global.ss")

(driver-loop)
