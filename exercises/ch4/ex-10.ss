; Exercise 4.10
; Design and implement a new syntax for Scheme by modifying the procedures in
; this section, without changing 'eval' or 'apply'

;; We can change assignment to use 'var'
(define (assignment? exp)
  (tagged-list? exp 'var))

;; Definition can be 'defn'
(define (definition? exp)
  (tagged-list? exp 'defn))

;; Or use post-fix operators by changing how 'tagged-list' looks at things
(define (last-element lst)
  (if (null? (cdr lst))
      (car lst)
      (last-element (cdr lst))))

(define (tagged-list? exp tag)
  (if (pair? exp)
      (let ((tag (last-element exp)))
        (eq? exp tag))
      #f))

;; Now we can define things to be last:
(1 2 3 +)
(3 define)
