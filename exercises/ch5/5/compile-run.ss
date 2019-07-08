; Running the compiler

(load "../../ch4/1/syntax.ss")
(load "../../ch4/1/ds.ss")
(load "../../ch4/1/global.ss")

(load "compile.ss")
(load "compile-linkage.ss")
(load "compile-combining-inst.ss")

(load "ex-38.ss") ; Open codes

(write-line
  (compile
    '(define (f x) (+ x (g (+ x 2))))
    'val
    'next))
