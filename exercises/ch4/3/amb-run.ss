; Run the amb evaluator

(load "../1/syntax.ss")
(load "../1/ds.ss")

(define apply-in-underlying-scheme apply)

(load "../1/ex-6.ss") ; let definition
(load "amb-evaluator.ss")
(load "../1/global.ss")
(load "amb-driver.ss")

(driver-loop)
