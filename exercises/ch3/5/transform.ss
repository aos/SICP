; Euler's transform

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))   ; S_n-1
        (s1 (stream-ref s 1))   ; S_n
        (s2 (stream-ref s 2)))  ; S_n+1
    (cons-stream
      (- s2 (/ (square (- s2 s1))
               (+ s0 (* -2 s1) s2)))
      (euler-transform (stream-cdr s)))))

; Make a tableau (a stream of streams)
(define (make-tableau transform s)
  (cons-stream
    s
    (make-tableau transform (transform s))))

; Form a sequence by taking the first term in each row
(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))
