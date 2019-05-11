; Driver loop using analysis

(load "syntax.ss")
(load "ds.ss")

(define apply-in-underlying-scheme apply)

(load "ex-6.ss") ; let definition
(load "analyze.ss")
(load "global.ss")

(driver-loop)
