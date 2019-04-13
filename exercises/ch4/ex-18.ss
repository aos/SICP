; Exercise 4.18
; Alternative strategies for scanning out definitions

(lambda (<vars>)
  (let ((u '*unassigned*)
        (v '*unassigned*))
    (let ((a (<e1>))
          (b (<e2>)))
      (set! u a)
      (set! v b))
    (<e3>)))

; 1. The above will not work because when we compute 'dy -> (stream-map f y),
; it will depend on 'y' which will not exist at this particular time!

; 2. This will work because when he hit 'dy, 'y has already been defined and
; assigned
