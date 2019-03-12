; Exercise 3.22
; Implement a queue with local state

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    ; Internal
    (define (set-front-ptr! item)
      (set! front-ptr item))
    (define (set-rear-ptr! item)
      (set! rear-ptr item))
    ; Operations
    (define (empty-queue?) (null? front-ptr))
    (define (front-queue) (car front-ptr))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               front-ptr)
              (else
                (set-cdr! rear-ptr new-pair)
                (set-rear-ptr! new-pair)
                front-ptr))))
    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with
                    an empty queue" front-ptr))
            (else
              (set-front-ptr! (cdr front-ptr))
              front-ptr)))
    (define (dispatch m)
      (cond ((eq? m 'empty?) (empty-queue?))
            ((eq? m 'insert) insert-queue!)
            ((eq? m 'delete) (delete-queue!))
            ((eq? m 'front) (front-queue))
            ((eq? m 'print) front-ptr)
            (else
              (error "Unknown operation called" m))))
    dispatch))

(define q (make-queue))
(q 'empty?)
((q 'insert) 'a)
((q 'insert) 'b)
(q 'delete)
(q 'front)
(q 'empty?)
((q 'insert) 'b)
(q 'delete)
(q 'print)
(q 'delete)
(q 'delete)
