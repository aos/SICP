; The Machine Model

(define (make-machine register-names
                      ops
                      controller-text)
  (let ((machine (make-new-machine)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register)
                 register-name))
              register-names)
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))

;; Registers
(define (make-register name)
  (let ((contents '*unassigned*))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
             (lambda (value)
               (set! contents value)))
            (else
              (error "Unknown request: REGISTER"
                     message))))
    dispatch))

(define (get-contents register)
  (register 'get))
(define (set-contents! register value)
  ((register 'set) value))

;; The stack
(define (make-stack)
  (let ((s '())
        (number-pushes 0)
        (max-depth 0)
        (current-depth 0))
    (define (push x)
      (set! s (cons x s))
      (set! number-pushes (+ 1 number-pushes))
      (set! current-depth (+ 1 current-depth))
      (set! max-depth
        (max current-depth max-depth)))
    (define (pop)
      (if (null? s)
          (error "Empty stack: POP")
          (let ((top (car s)))
            (set! s (cdr s))
            (set! current-depth
              (- current-depth 1))
            top)))
    (define (initialize)
      (set! s '())
      (set! number-pushes 0)
      (set! max-depth 0)
      (set current-depth 0)
      'done)
    (define (print-statistics)
      (newline)
      (display (list 'total-pushes
                     '=
                     number-pushes
                     'max-depth
                     '=
                     max-depth))
      (newline))
    (define (dispatch message)
      (cond ((eq? message 'push) push)
            ((eq? message 'pop) (pop))
            ((eq? message 'initialize)
             (initialize))
            ((eq? message 'print-statistics)
             (print-statistics))
            (else
              (error "Unknown request: STACK"
                     message))))
    dispatch))

(define (pop stack) (stack 'pop))
(define (push stack value)
  ((stack 'push) value))

;; Basic machine model
(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag)) ; Used to control branching
        (stack (make-stack))
        (the-instruction-sequence '())
        (inst-execute-count 0)
        (trace #f)
        (break-on #f)
        (curr-label '*unassigned*)
        (bps (list '*breakpoints*)))
    (let ((the-ops
            (list (list 'initialize-stack
                        (lambda ()
                          (stack 'initialize)))
                  (list 'print-stack-statistics
                        (lambda ()
                          (stack 'print-statistics)))))
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
      (define (breakpoint-set? label count)
        (let ((existing-bp (lookup-table label count bps)))
          (and existing-bp
               (eq? existing-bp 'on))))
      (define (set-bp! label n)
        (insert-table! label n 'on bps))
      (define (unset-bp! label n)
        (insert-table! label n 'off bps))
      (define (unset-all-bps!)
        (set! bps (list '*breakpoints*))
        'done)
      (define (print-and-reset-inst-count)
        (display (list 'instruction-count
                       '=
                       inst-execute-count))
        (newline)
        (set! inst-execute-count 0))
      (define (dispatch message)
        (cond ((eq? message 'start)
               (set-contents!
                 pc
                 the-instruction-sequence)
               (execute))
              ((eq? message 'install-instruction-sequence)
               (lambda (seq)
                 (set! the-instruction-sequence
                   seq)))
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
              ((eq? message 'print-and-reset-inst-count)
               (print-and-reset-inst-count))
              ((eq? message 'trace-on) (set! trace #t)
                                       '*tracing-on*)
              ((eq? message 'trace-off) (set! trace #f)
                                        '*tracing-off*)
              ((eq? message 'insert-breakpoint) set-bp!)
              ((eq? message 'cancel-breakpoint) unset-bp!)
              ((eq? message 'cancel-all-bps) (unset-all-bps!))
              ((eq? message 'proceed) (execute))
              (else (error "Unknown request: MACHINE"
                           message))))
      dispatch)))

(define (start machine)
  (machine 'start))

(define (get-register-contents machine
                               register-name)
  (get-contents
    (get-register machine register-name)))

(define (set-register-contents! machine
                                register-name
                                value)
  (set-contents!
    (get-register machine register-name)
    value)
  'done)

(define (get-register machine reg-name)
  ((machine 'get-register) reg-name))

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      #f))
