; Miller-Rabin test

; An alternative form of Fermat's Little Theorem:
; If 'n' is a prime number, and 'a' < 'n', then:
; a^(n - 1) ≡ 1 (mod n)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (check-non-trivial (expmod base (/ exp 2) m) m)
             0 
             (remainder (square (expmod base (/ exp 2) m))
                        m)))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

; Non-trivial square root of 1 modulo 'n':
; A number not equal to '1' or 'n - 1' whose square is congruent to 1 modulo n
(define (check-non-trivial a n)
  (cond ((= a 1) #f)
        ((= a (- n 1)) #f)
        ((= (remainder (square a) n) (remainder 1 n)) #t)
        (else #f)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n)
  ; Run fast-prime? an arbitray # of times (100)
  (fast-prime? n 100))

; Test (some of) the Carmichael numbers that fool the Fermat test
; 561, 1105, 1729, 2465, 2821, 6601
(define (carmichaels n)
  (cond ((= n 1) 561)
        ((= n 2) 1105)
        ((= n 3) 1729)
        ((= n 4) 2465)
        ((= n 5) 2821)
        (else 6601)))

(define (display-report a b)
  (display a)
  (display ": ")
  (if b (display "Prime") (display "Not a prime"))
  (newline))

(display-report (carmichaels 1) (prime? (carmichaels 1)))
