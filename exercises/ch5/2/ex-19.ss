; Exercise 5.19
; Breakpoints

; 1. A 2d association list on the machine model will hold all breakpoints (if
; any) with the structure ('label instruction-n)
; 2. We change the first instruction after every label to also hold the label,
; if a label exists, we set it as the current label and start an instruction
; counter. We reset the counter on every label change
; 3. On every instruction, we check to see if that label/instruction count
; matches. If matching, we stop execution.
; 4. (proceed-machine) should just call execute
; 5. (cancel-breakpoint) should delete that association from the list
; (alternatively we can also put a third parameter that turns off the
; breakpoint)
; 6. (cancel-all-breakpoints) resets the association list to nil

(define (execute)
  (let ((insts (get-contents pc)))
    (if (null? insts)
        'done
        (begin
          (if break-on
              (begin
                (set! break-on #f)
                (write-line (list "Pausing execution -- label:"
                                  curr-label
                                  "Offset:"
                                  inst-execute-count)))
              (begin
                (if (not (null? (instruction-label (car insts))))
                    (begin
                      (set! curr-label (instruction-label (car insts)))
                      (set! inst-execute-count 0)) ; Reset count
                    (set! inst-execute-count (+ 1 inst-execute-count)))
                (if (breakpoint-set? curr-label inst-execute-count)
                    (set! break-on #t))
                (if trace
                    (write-line (list "executing instruction:"
                                      (instruction-text (car insts)))))
                ((instruction-execution-proc (car insts)))
                (execute)))))))
;
;(define (proceed)
;  (set! inst-execute-count (+ 1 inst-execute-count))
;  ((instruction-execution-proc paused-inst))
;  (set! paused-inst '*unassigned*)
;  (execute))
;
;(define (breakpoint-set? label count)
;  (let ((existing-bp (lookup-table label count bps)))
;    (and existing-bp
;         (eq? (cadr existing-bp) 'on))))
;
;(define (set-bp! label n)
;  (insert-table! label n 'on bps))
;
;(define (unset-bp! label n)
;  (insert-table! label n 'off bps))
;
;(define (unset-all-bps!)
;  (set! bps (list '*breakpoints*))
;  'done)

;; Machine level instructions
(define (set-breakpoint machine label n)
  ((machine 'insert-breakpoint) label n)
  'breakpoint-set)

(define (cancel-breakpoint machine label n)
  ((machine 'cancel-breakpoint) label n)
  'breakpoint-cancelled)

(define (cancel-all-breakpoints machine)
  (machine 'cancel-all-bps))

(define (proceed-machine machine)
  (machine 'proceed))

;; Helper functions
(define (lookup-table key-1 key-2 table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
        (let ((record (assoc key-2 (cdr subtable))))
          (if record (cdr record) #f))
        #f)))

(define (insert-table! key-1 key-2 value table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
        (let ((record (assoc key-2 (cdr subtable))))
          (if record
              (set-cdr! record value)
              (set-cdr! subtable
                        (cons (cons key-2 value)
                              (cdr subtable)))))
        (set-cdr! table
                  (cons (list key-1 (cons key-2 value))
                        (cdr table))))))
