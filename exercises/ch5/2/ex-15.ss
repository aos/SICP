; Exercise 5.15
; Instruction counting

;; Insert these into machine model

; (inst-execute-count 0) ;; initialized variable

(define (print-and-reset-inst-count)
  (display (list 'instruction-count
                 '=
                 inst-execute-count))
  (newline)
  (set! inst-execute-count 0))

(define (execute)
  (let ((insts (get-contents pc)))
    (if (null? insts)
        'done
        (begin
          ((instruction-execution-proc
             (car insts)))
          (set! inst-execute-count
            (+ 1 inst-execute-count))
          (execute)))))

((eq? message 'print-and-reset-inst-count)
 (print-and-reset-inst-count))
