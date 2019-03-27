; Exercise 3.59
; Power series and integrals
; Power rule: x^n = x^(n + 1) / (n + 1)

(define ones (cons-stream 1 ones))

(define integers
  (cons-stream 1 (add-streams ones integers)))

(define fractions
  (stream-map
    (lambda (x) (/ 1 x))
    integers))

; 1.
(define (integrate-series stream)
  (mul-streams stream fractions))

; 1b -- simpler:
(define (integrate-series series)
  (stream-map / series integers))

; 2.
; x → e^x is its own derivative
(define exp-series
  (cons-stream
    1 (integrate-series exp-series)))

; Generate series for sine and cosine
; 1. Derivative of sine is cosine
; 2. Derivative of cosine is negative sine
(define cosine-series
  (cons-stream 1
               (integrate-series sine-series)))

(define sine-series
  (cons-stream 0
               (integrate-series
                 (scale-stream cosine-series -1))))
