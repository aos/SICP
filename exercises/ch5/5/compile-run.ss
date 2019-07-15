; Running the compiler

(load "../../ch4/1/syntax.ss")
(load "../../ch4/1/ds.ss")
(load "../../ch4/1/global.ss")

(load "compile.ss")
(load "compile-linkage.ss")
(load "compile-combining-inst.ss")

(load "ex-38.ss") ; Open codes
(load "ex-39.ss") ; lexical-address-lookup and set!
(load "ex-40.ss") ; compile-time env
(load "ex-41.ss") ; find-variable
(load "ex-42.ss") ; compile-{variable,assignment} using compile-env

(write-line
  (compile
    '(define (factorial n)
     (if (= n 1)
         1
         (* (factorial (- n 1)) n)))
    'val
    'next)))
