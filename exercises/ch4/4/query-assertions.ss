; Finding Assertions

;; Pattern Matching

; Called by 'simple-query'
(define (find-assertions pattern frame)
  (stream-flatmap
    (lambda (datum)
      (check-an-assertion datum pattern frame))
    ; Gets a stream of all assertions in the database that should be checked
    ; for a match
    (fetch-assertions pattern frame)))

(define (check-an-assertion
          assertion query-pat query-frame)
  (let ((match-result
          (pattern-match
            query-pat assertion query-frame)))
    (if (eq? match-result 'failed)
        the-empty-stream
        (singleton-stream match-result))))

(define (pattern-match pat dat frame)
  (cond ((eq? frame 'failed) 'failed)
        ((equal? pat dat) frame)
        ; Bind the variable to the data
        ((var? pat)
         (extend-if-consistent pat dat frame))
        ((and (pair? pat) (pair? dat))
         (pattern-match
           (cdr pat)
           (cdr dat)
           (pattern-match
             (car pat) (car dat) frame)))
        (else 'failed)))

(define (extend-if-consistent var dat frame)
  (let ((binding (binding-in-frame var frame)))
    (if binding
        (pattern-match
          (binding-value binding) dat frame)
        ; Add binding of variable to data
        (extend var dat frame))))
