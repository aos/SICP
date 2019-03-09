; Exercise 3.8
; Define a simple procedure 'f' such that evaluating

(+ (f 0) (f 1))

; will return 0 if arguments are evaluated left-to-right
; and returns 1 if arguments are evaluated right-to-left

(define (base-fn calls)
  (let ((num 0))
    (lambda (n)
      (if (= calls 0)
          (begin (set! num n)
                 (set! calls 1)
                 n)
          (* num n)))))

(define f (base-fn 0))

(+ (f 0) (f 1))

(+ (f 1) (f 0))

; A simpler solution which uses the last set value
(define f
  (let ((count 1))
    (lambda (n)
      (set! count (* count n))
      count)))
