MACHINE Factorial_While
OPERATIONS
          y <-- fact(para) = PRE para:NATURAL THEN
                 VAR x IN
                   y := 1; x:=para;
                   WHILE not (x = 0)
                    DO
		                     y := y * x ;
                         x := x - 1
		                INVARIANT x:NATURAL & y:NATURAL
		                VARIANT x
		               END
		             END
		        END
END
