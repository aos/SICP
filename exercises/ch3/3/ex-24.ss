; Exercise 3.24
; Design a table constructor 'make-table' that takes as an argument a
; 'same-key?' procedure that will be used to test "equality" of keys

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) #f)
            ((same-key? key (caar records))
             (car records))
            (else (assoc key (cdr records)))))
    (define (lookup key)
      (let ((record (assoc key (cdr local-table))))
        (if record
            (cdr record)
            #f)))
    (define (insert! key value)
      (let ((record (assoc key (cdr local-table))))
        (if record
            (set-cdr! record value)
            (set-cdr! local-table
                      (cons (cons key value)
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup) lookup)
            ((eq? m 'insert) insert!)
            (else (error "Unknown operation:
                         TABLE" m))))
    dispatch))

(define (num-close? key-1 key-2)
  (<= (abs (- key-2 key-1))
      2))

(define nt (make-table num-close?))
((nt 'insert) 44 'hello)
((nt 'lookup) 41)
((nt 'lookup) 42)
((nt 'lookup) 45)
