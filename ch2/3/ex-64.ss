; Exercise 2.64

; 1. Divide the number of elements in the list in half (recursively)
; 2. Create a left sub-tree based on the left-size (based on the divided number
; starting from the left first item)
; 3. Create a middle element as the first item of what's left after taking away
; the left part of the tree
; 4. Create a right sub-tree as the rest of the items of what's left of the left
; subtree
; 5. Finally, make a tree with the left sub-tree, middle element, and right
; sub-tree

(define (list->tree elements)
  (car (partial-tree 
        elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size 
             (quotient (- n 1) 2)))
        (let ((left-result 
               (partial-tree 
                elts left-size)))
          (let ((left-tree 
                 (car left-result))
                (non-left-elts 
                 (cdr left-result))
                (right-size 
                 (- n (+ left-size 1))))
            (let ((this-entry 
                   (car non-left-elts))
                  (right-result 
                   (partial-tree 
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree 
                     (car right-result))
                    (remaining-elts 
                     (cdr right-result)))
                (cons (make-tree this-entry 
                                 left-tree 
                                 right-tree)
                      remaining-elts))))))))

(list->tree '(1 3 5 7 9 11))
