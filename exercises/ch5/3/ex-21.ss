; Exercise 5.21

; 1. Recursive count-leaves
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else
          (+ (count-leaves (car tree))
             (count-leaves (cdr tree))))))

(define (not-pair? l)
  (not (pair? l)))

(define count-leaves-machine
  (make-machine
    `((null? ,null?)
      (+ ,+)
      (car ,car)
      (cdr ,cdr)
      (not-pair? ,not-pair?)
      (read ,read)
      (print ,write-line))

    '(controller
        (assign tree (op read))
        (assign continue (label count-done))

      count-loop
        (test (op null?) (reg tree))
        (branch (label tree-null))
        (test (op not-pair?) (reg tree))
        (branch (label tree-not-pair))
        (save continue)
        (assign continue (label left-tree))
        (save tree)
        (assign tree (op car) (reg tree))
        (goto (label count-loop))

      left-tree
        (restore tree)
        (assign tree (op cdr) (reg tree))
        (assign continue (label right-tree))
        (save val)
        (goto (label count-loop))

      right-tree
        ; we don't need tree register anymore
        ; so we can reuse it for something else
        (assign tree (reg val))
        (restore val)
        (restore continue)
        (assign val (op +) (reg val) (reg tree))
        (goto (reg continue))

      tree-null ; base case (null? tree)
        (assign val (const 0))
        (goto (reg continue))

      tree-not-pair
        ; base case (not (pair? tree))
        (assign val (const 1))
        (goto (reg continue))

      count-done
        (perform (op print) (reg val)))))

; 2. With explicit counter
(define (count-leaves tree)
  (define (count-iter tree n)
    (cond ((null? tree) n)
          ((not (pair? tree)) (+ n 1))
          (else
            (count-iter
              (cdr tree)
              (count-iter (car tree)
                          n)))))
  (count-iter tree 0))

(define count-iter-machine
  (make-machine
    `((null? ,null?)
      (+ ,+)
      (car ,car)
      (cdr ,cdr)
      (pair? ,pair?)
      (read ,read)
      (print ,write-line))

    '(controller
        (assign tree (op read))
        (assign count (const 0))
        (assign continue (label done))

      count-iter
        (test (op null?) (reg tree))
        (branch (label tree-null))
        (test (op pair?) (reg tree))
        (branch (label tree-pair))
        (assign count (op +) (reg count) (const 1))
        (goto (reg continue))

      tree-null
        (goto (reg continue))

      tree-pair
        (save continue)
        (save tree)
        (assign tree (op car) (reg tree))
        (assign continue (label after-left-tree))
        (goto (label count-iter))

      after-left-tree
        (restore tree)
        (assign tree (op cdr) (reg tree))
        (assign continue (label after-right-tree))
        (goto (label count-iter))

      after-right-tree
        (restore continue)
        (goto (reg continue))

      done
        (perform (op print) (reg count)))))
