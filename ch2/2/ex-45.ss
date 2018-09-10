; Exercise 2.45
; Re-define 'right-split' and 'up-split' in terms of a general
; 'split' procedure

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter
                (below smaller smaller)))))

(define right-split (split beside below))
(define up-split (split below beside))

(define (split prop1 prop2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split prop1 prop2) painter (- n 1))))
          (prop1 painter
                 (prop2 smaller smaller))))))

;; With an explicit internal function
(define (split f g)
  (define (rec painter n)
    (if (= n 0)
        painter
        (let ((smaller (rec painter (- n 1))))
          (f painter
             (g smaller smaller)))))
  rec)
