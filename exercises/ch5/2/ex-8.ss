; Exercise 5.8

; 1. 3 --> we use assoc to build the label table and it will default to the
; first table entry

(define (extract-labels text receive)
  (if (null? text)
      (receive '() '())
      (extract-labels
        (cdr text)
        (lambda (insts labels)
          (let ((next-inst (car text)))
            (if (symbol? next-inst) ; label
                (let ((label-found (assoc next-inst labels)))
                  (if label-found
                      (error "Label already exists: EXTRACT-LABELS:"
                             next-inst)
                      (receive
                        insts
                        (cons
                          (make-label-entry
                            next-inst
                            insts)
                          labels))))
                (receive
                  (cons (make-instruction
                          next-inst)
                        insts)
                  labels)))))))
