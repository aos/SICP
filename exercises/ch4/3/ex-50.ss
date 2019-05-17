; Exercise 4.50
; amb -> ramb

;; Shuffle a list
(define (shuffle lst)
  (map cdr
       (sort
         (map (lambda (x) (cons (random 1.0) x)) lst)
         (lambda (x y) (< (car x) (car y))))))

(define (analyze-amb exp)
  (let ((cprocs
          (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices)
             env
             succeed
             (lambda ()
               (try-next (cdr choices))))))
      (try-next (shuffle cprocs)))))
