; Exercise 3.46
; How can 'test-and-set!' fail by allowing two processes to acquire the mutex
; at the same time?

; It is possible that while one 'test-and-set!' operation is retrieving a
; 'false' value from the cell, another one has acquired it, and set it true.
; Then, after it has grabbed it with a value of 'false', it will also set it to
; 'true'. Thereby two mutexes have acquired the lock and set it to true.
