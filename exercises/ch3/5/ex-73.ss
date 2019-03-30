; Exercise 3.73

(define (RC R C dt)
  (lambda (int i v0)
    (add-streams (scale-stream i R)
                 (integral
                   (scale-stream i (/ 1 C))
                   v0
                   dt))))

(define RC1 (RC 5 1 0.5))
