; Running the compiler

(load "../../ch4/1/syntax.ss")
(load "../../ch4/1/ds.ss")
(load "../../ch4/1/global.ss")

(load "compile.ss")
(load "compile-linkage.ss")
(load "compile-combining-inst.ss")

(write-line
  (compile
    '(define (factorial n)
       (define (iter product counter)
         (if (> counter n)
             product
             (iter (* counter product)
                   (+ counter 1))))
       (iter 1 1))
    'val
    'next))
