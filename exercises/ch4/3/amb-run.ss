; Run the amb evaluator

(load "../1/syntax.ss")
(load "../1/ds.ss")

(define apply-in-underlying-scheme apply)

(load "../1/ex-6.ss") ; let definition
(load "amb-evaluator.ss")
(load "../1/global.ss")
(load "amb-driver.ss")
(load "ex-51.ss") ; permanent-set! definiton
(load "ex-52.ss") ; if-fail definition
(load "ex-54.ss") ; require definition

(driver-loop)

(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items)
       (an-element-of (cdr items))))
