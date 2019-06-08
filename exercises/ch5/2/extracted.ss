; Sample output from extract labels
Instructions:
(((goto (label here)))
 ((assign a (const 3)))
 ((goto (label there)))
 ((assign a (const 4)))
 ((goto (label there))))

Labels:
((start
   ((goto (label here)))
   ((assign a (const 3)))
   ((goto (label there)))
   ((assign a (const 4)))
   ((goto (label there))))
 (here
   ((assign a (const 3)))
   ((goto (label there)))
   ((assign a (const 4)))
   ((goto (label there))))
 (here
   ((assign a (const 4)))
   ((goto (label there))))
 (there))
