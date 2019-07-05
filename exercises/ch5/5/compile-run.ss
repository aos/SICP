; Running the compiler

(load "../../ch4/1/syntax.ss")
(load "../../ch4/1/ds.ss")
(load "../../ch4/1/global.ss")

(load "compile.ss")
(load "compile-linkage.ss")
(load "compile-combining-inst.ss")

(compile
  '(define (factorial n)
     (if (= n 1)
         1
         (* n (factorial (- n 1)))))
  'val
  'next)
