; Exercise 5.22
; append and append! machines

; 1. append
(define (append x y)
  (if (null? x)
      y
      (cons (car x)
            (append (cdr x) y))))

(define append-machine
  (make-machine
    `((null? ,null?)
      (car ,car)
      (cdr ,cdr)
      (cons ,cons)
      (read ,read)
      (print ,write-line))

    '(controller
        (assign x (op read))
        (assign y (op read))
        (assign continue (label done))

      append-loop
        (test (op null?) (reg x))
        (branch (label null-x))
        (save continue)
        (assign car-x (op car) (reg x))
        (save car-x)
        (assign continue (label after-cdr-x))
        (assign x (op cdr) (reg x))
        (goto (label append-loop))

      after-cdr-x
        (restore car-x)
        (restore continue)
        (assign x (op cons) (reg car-x) (reg x))
        (goto (reg continue))

      null-x
        (assign x (reg y))
        (goto (reg continue))

      done
        (perform (op print) (reg x)))))

; 2. append!
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define append!-machine
  (make-machine
    `((null? ,null?)
      (cdr ,cdr)
      (set-cdr! ,set-cdr!)
      (read ,read)
      (print ,write-line))

    '(start
        (assign x (op read))
        (assign y (op read))
        (assign temp (reg x))

      last-pair-loop
        (assign temp-cdr (op cdr) (reg temp))
        (test (op null?) (reg temp-cdr))
        (branch (label last-pair))
        (assign temp (op cdr) (reg temp))
        (goto (label last-pair-loop))

      last-pair
        (perform (op set-cdr!) (reg temp) (reg y))

      done
        (perform (op print) (reg x)))))
