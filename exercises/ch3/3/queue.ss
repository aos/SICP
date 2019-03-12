; Representing a queue
; with front and back pointers

(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item)
  (set-car! queue item))
(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

; Queue operations
(define (empty-queue? queue)
  (null? (front-ptr queue)))
(define (make-queue) (cons '() '()))

; Selectors
(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an
             empty queue" queue)
      (car (front-ptr queue))))

; Create a new pair whose car is the item and cdr is empty list
; Modify final pair in queue to point to new pair
; Set rear pointer to new pair
(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else (set-cdr! (rear-ptr queue)
                          new-pair)
                (set-rear-ptr! queue new-pair)
                queue))))

; Set front pointer to next item in queue
(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with
                an empty queue" queue))
        (else 
          (set-front-ptr! queue
                          (cdr (front-ptr queue)))
          queue)))
