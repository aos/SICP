; Exercise 3.65
; Compute sequences for ln 2

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

;; ln2 = 1 - 1/2 + 1/3 - 1/4 + ...
(define (ln2-summands n)
  (cons-stream
    (/ 1.0 n)
    (stream-map - (ln2-summands (+ n 1)))))

(define ln2-stream
  (partial-sums (ln2-summands 1)))

;; try accelerating it
(define acc-ln2
  (euler-transform ln2-stream))

; accelerate it even more
(define tabbed-ln2
  (accelerated-sequence euler-transform ln2-stream))

;; It converges... pretty fast!
(partial-stream->list 10 tabbed-ln2)
