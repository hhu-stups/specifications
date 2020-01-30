MODEL
   NoAssignmentToOutput
 /* This model is accepted by B4Free and fully proven */
OPERATIONS
 x,y <-- op(a) = PRE a:INT THEN
                   IF a>0 THEN
                     x,y := a,a
                   ELSE
                     x := 0
                   END
                 END
END