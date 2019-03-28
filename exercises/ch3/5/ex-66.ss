; Exercise 3.66
; (pairs integers integers)

(define (add-streams s1 s2) (stream-map + s1 s2))
(define ones (cons-stream 1 ones))
(define integers
  (cons-stream 1 (add-streams ones integers)))

(define ints
  (pairs integers integers))

(partial-stream->list 30 ints)

; Approximately 200 pairs precede the pair (1, 100)
; Wayyyyy more for (99, 100) and about 100 or so more for (100, 100)
