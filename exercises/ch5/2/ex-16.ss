; Exercise 5.16
; Instruction tracing

;; Augment (make-new-machine)
;; Add variable: (debug #f)

(define (execute)
  (let ((insts (get-contents pc)))
    (if (null? insts)
        'done
        (begin
          (if debug
              (begin
                (display (list 'executing-instruction
                               (caar insts)))
                (newline)))
          ((instruction-execution-proc
             (car insts)))
          (execute)))))

;; Augment (dispatch) with these methods
((eq? message 'trace-on)
  (set! debug #t)
  '*tracing-on*)

((eq? message 'trace-off)
 (set! debug #f)
 '*tracing-off*)
