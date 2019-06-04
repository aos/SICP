; The Assembler
; Transforms sequence of controller expressions for a machine into a
; corresponding list of machine instructions, each with its execution
; procedure
; 
; 1. Scans controller text to separate labels from instructions
; 2. Constructs a list of instructions and a table that associates each label
; with a pointer into that list
; 3. Augments the instruction list by inserting the execution procedure for
; each instruction

(define (assemble controller-text machine)
  (extract-labels controller-text
                  (lambda (insts labels) ; receive
                    (update-insts! insts
                                   labels
                                   machine)
                    insts)))

(define (extract-labels text receive)
  (if (null? text)
      (receive '() '())
      (extract-labels
        (cdr text)
        (lambda (insts labels)
          (let ((next-inst (car text)))
            (if (symbol? next-inst) ; label
                (receive
                  insts
                  (cons
                    (make-label-entry
                      next-inst
                      insts)
                    labels))
                (receive
                  (cons (make-instruction
                          next-inst)
                        insts)
                  labels)))))))
