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
    '(((lambda (x y)
         (lambda (a b c d e)
           ((lambda (y z) (* x y z))
            (* a b x)
            (+ c d x))))
       3 4)
      1 2 3 4 5)
    'val
    'next
    '()))
