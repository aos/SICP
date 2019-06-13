; Exercise 5.12

; 1. List of all instructions with dupes removed,
; sorted by instruction type. This procedure is used
; by all other parts of the exercise

(define (make-instruction-table insts)
  (let ((inst-table '()))
    (for-each
      (lambda (inst)
        (let* ((type (instruction-type inst))
               (text (instruction-operands inst))
               (val (assoc type inst-table)))
          (if val
              (if (not (element-of-set? text (cdr val)))
                  (set-cdr! val (cons text (cdr val))))
              (set! inst-table
                (cons (list type text)
                      inst-table)))))
      insts)
    inst-table))

(define (instruction-operands inst)
  (cdar inst))
(define (instruction-type inst)
  (caar inst))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((not (element-of-set? (car set2) set1))
         (cons (car set2)
               (union-set set1 (cdr set2))))
        (else (union-set set1 (cdr set2)))))

(define (assemble register-names controller-text machine)
  (extract-labels controller-text
                  (lambda (insts labels)
                    ;; Create the instruction table (1 2 3 4)
                    (let ((inst-table (make-instruction-table insts)))
                      (let ((entry-point-regs (create-list-entry-regs
                                                inst-table))
                            (save-restore-regs (create-list-save-restore
                                                 inst-table))
                            (assign-source-regs (create-assign-list-regs
                                                  inst-table
                                                  register-names)))
                        (update-insts! insts
                                       labels
                                       machine)
                        (list insts
                              inst-table ; (1)
                              entry-point-regs ; (2)
                              save-restore-regs ; (3)
                              assign-source-regs)))))) ; (4)

;; 2. List of registers that hold entry points
; Parse inst-table for 'goto', grab all 'reg'
(define (create-list-entry-regs inst-table)
  (let ((entry-pts (assoc 'goto inst-table)))
    (if entry-pts
        (map cadr
             (filter (lambda (inst) (eq? (car inst) 'reg))
                     (fold-right append '() (cdr entry-pts))))
        '())))

;; 3. List of registers that are saved or restored
(define (create-list-save-restore inst-table)
  (let ((restore-regs (assoc 'restore inst-table))
        (save-regs (assoc 'save inst-table)))
    (if restore-regs
        (union-set (cdr save-regs)
                   (cdr restore-regs))
        (or save-regs '()))))

;; 4. For each register, a list of sources for which it is assigned
(define (create-assign-list-regs inst-table register-names)
  (let ((assign-regs (assoc 'assign inst-table))
        (assign-list '()))
    (for-each
      (lambda (reg-name)
        (set! assign-list
          (cons (list reg-name
                      (map cdr
                           (filter
                             (lambda (inst) (eq? (car inst) reg-name))
                             (cdr assign-regs))))
                assign-list)))
      register-names)
    assign-list))

(define (make-machine register-names
                      ops
                      controller-text)
  (let ((machine (make-new-machine)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register)
                 register-name))
              register-names)
    ((machine 'install-operations) ops)
    ;; Modified to add table and other lists (1 2 3 4)
    ((machine 'install-insts-and-lists)
     (assemble register-names controller-text machine))
    machine))

(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '())
        (inst-table '()) ; (1)
        (entry-point-regs '()) ; (2)
        (save-restore-regs '()) ; (3)
        (assign-source-regs '())) ; (4)
    (let ((the-ops
            (list (list 'initialize-stack
                        (lambda ()
                          (stack 'initialize)))))
          (register-table
            (list (list 'pc pc)
                  (list 'flag flag))))
      (define (allocate-register name)
        (if (assoc name register-table)
            (error
              "Multiply defined register: "
              name)
            (set! register-table
              (cons
                (list name
                      (make-register name))
                register-table)))
        'register-allocated)
      (define (lookup-register name)
        (let ((val
                (assoc name register-table)))
          (if val
              (cadr val)
              (error "Unknown register:" name))))
      (define (execute)
        (let ((insts (get-contents pc)))
          (if (null? insts)
              'done
              (begin
                ((instruction-execution-proc
                   (car insts)))
                (execute)))))
      (define (dispatch message)
        (cond ((eq? message 'start)
               (set-contents!
                 pc
                 the-instruction-sequence)
               (execute))
              ((eq? message 'install-insts-and-lists) ; (1, 2, 3, 4)
               (lambda (seq-and-lists)
                 (set! the-instruction-sequence
                   (list-ref seq-and-lists 0))
                 (set! inst-table (list-ref seq-and-lists 1))
                 (set! entry-point-regs (list-ref seq-and-lists 2))
                 (set! save-restore-regs (list-ref seq-and-lists 3))
                 (set! assign-source-regs (list-ref seq-and-lists 4))))
              ((eq? message
                    'allocate-register)
               allocate-register)
              ((eq? message 'get-register)
               lookup-register)
              ((eq? message 'install-operations)
               (lambda (ops)
                 (set! the-ops
                   (append the-ops ops))))
              ((eq? message 'stack) stack)
              ((eq? message 'operations) the-ops)
              ((eq? message 'inst-table) inst-table) ; (1)
              ((eq? message 'entry-point-regs) entry-point-regs) ; (2)
              ((eq? message 'save-restore-regs) save-restore-regs) ; (3)
              ((eq? message 'assign-source-regs) assign-source-regs) ; (4)
              (else (error "Unknown request: MACHINE"
                           message))))
      dispatch)))

;; Example
; Some instructions (from extract-labels)
;(define someinsts
;  '(((assign continue (label expt-done)))
;    ((test (op =) (reg n) (const 0)))
;    ((branch (label base-case)))
;    ((save continue))
;    ((assign n (op -) (reg n) (const 1)))
;    ((assign continue (label after-expt)))
;    ((goto (label expt-loop)))
;    ((restore continue))
;    ((assign val (op *) (reg b) (reg val)))
;    ((goto (reg continue)))
;    ((assign val (const 1)))
;    ((goto (reg continue)))))

;; Turn into this inst-table
;'((restore
;    (continue))
;  (goto
;    ((reg continue))
;    ((label expt-loop)))
;  (save
;    (continue))
;  (branch
;    ((label base-case)))
;  (test
;    ((op =) (reg n) (const 0)))
;  (assign
;    (val (const 1))
;    (val (op *) (reg b) (reg val))
;    (continue (label after-expt))
;    (n (op -) (reg n) (const 1))
;    (continue (label expt-done))))
