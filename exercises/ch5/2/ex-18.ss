; Exercise 5.18
; Modify make-register to be traceable

(define (make-register name)
  (let ((contents '*unassigned*)
        (debug #f))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
             (lambda (value)
               (if debug
                   (begin
                     (display (list "Setting register"
                                    name
                                    "Old value:"
                                    contents
                                    "New value:"
                                    value))
                     (newline)))
               (set! contents value)))
            ((eq? message 'trace-on)
             (set! debug #t))
            ((eq? message 'trace-off)
             (set! debug #f))
            (else
              (error "Unknown request: REGISTER"
                     message))))
    dispatch))

(define (trace register)
  (register 'trace-on))
(define (trace-off register)
  (register 'trace-off))

(define (trace-on-register machine
                           register-name)
  (trace
    (get-register machine register-name))
  'trace-on)

(define (trace-off-register machine
                            register-name)
  (trace-off
    (get-register machine register-name))
  'trace-off)
