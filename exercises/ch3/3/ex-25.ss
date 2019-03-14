; Exercise 3.25
; Generalize one- and two-dimensional tables
; Values are stored under an arbitrary number of keys
; and different values may be stored under different number of keys
; Lookup and insert! should take as input a list of keys used to access the
; table

(define (make-table)
  (let ((local-table (list '*table*)))
    ; internal definitions go here
    (define (assoc key records)
      (cond ((null? records) #f)
            ((equal? key (caar records))
             (car records))
            (else (assoc key (cdr records)))))
    (define (lookup key-list)
      (define (iter keys table)
        (cond ((null? (cdr keys))
               (let ((record (assoc (car keys) (cdr table))))
                 (if record (cdr record) #f)))
              (else
                (let ((subtable (assoc (car keys) (cdr table))))
                  (if subtable
                      (iter (cdr keys) subtable)
                      #f)))))
      (iter key-list local-table))
    (define (insert! key-list value)
      (define (iter keys table)
        (cond ((null? (cdr keys))
               ; No more tables defined -- only key
               (let ((record (assoc (car keys) (cdr table))))
                 (if record
                     (set-cdr! record value)
                     (set-cdr! table
                               (cons (cons (car keys) value)
                                     (cdr table))))))
              (else
                ; Dig into table names -- create if not found
                (let ((subtable (assoc (car keys) (cdr table))))
                  (cond (subtable (iter (cdr keys) subtable))
                        (else
                          (set-cdr! table
                                    (cons (list (car keys))
                                          (cdr table)))
                          (iter (cdr keys) (cadr table))))))))
      (iter key-list local-table)
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'get) lookup)
            ((eq? m 'set) insert!)))
    dispatch))

(define tb (make-table))

(define some-keys '(hello one two three))
((tb 'set) some-keys 'found-me!)
((tb 'get) some-keys) ; found-me!

(define others '(hello one four))
((tb 'set) others 'woohoo)
((tb 'get) others) ; woohoo

((tb 'get) '(hello one two five)) ; #f

((tb 'set) '(hello) 'at-the-top)
((tb 'get) '(hello)) ; at-the-top
