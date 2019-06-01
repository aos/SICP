; Exercise 4.73

; It will end up with an infinite loop if the stream is infinite. The arguments
; to interleave: (stream-car stream) and (flatten-stream (stream-cdr stream))
; will be evaluated first.
