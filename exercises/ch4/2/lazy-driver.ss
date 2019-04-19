; Driver loop

(load "../1/syntax.ss")
(load "../1/ds.ss")

(define apply-in-underlying-scheme apply)

(load "lazy-evaluator.ss")
(load "../1/global.ss")
(load "thunk.ss")

(define input-prompt ";;; L-Eval input:")
(define output-prompt ";;; L-Eval value:")

(define (driver-loop)
  (prompt-for-input input-prompt)
  (let ((input (read)))
    (let ((output (actual-value
                    input
                    the-global-environment)))
      (announce-output output-prompt)
      (user-print output)))
  (driver-loop))

(driver-loop)
