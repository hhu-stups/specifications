MACHINE WhileVariantNotDecreased
/* Location description is wrong  */
/*
A while-loop VARIANT error occurred.
Reason:  While VARIANT not decreasing:
Details: 9,9
Context:
OPERATION: Set
...
Correct location is line 24 and pos 15
*/

OPERATIONS
  Set =
    BEGIN
      VAR i
      IN
        i := 1
        ;
        WHILE i < 10
        DO
          skip
        INVARIANT 1=1
        VARIANT 10 -i
        END
      END
    END
END
