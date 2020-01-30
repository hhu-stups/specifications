MACHINE int_completeness1_event
/* int_completeness1 encoded using an IF-THEN-ELSE within an operation */
VARIABLES bound
INVARIANT bound:NATURAL1
INITIALISATION bound := 4
OPERATIONS
  res <-- SolExists =
   IF #(x1,x2).(
	  x1 > 0 &
	  x2 < 0 &
  
	  (x1-x2) > 0 &
	  (x1-x2) < bound &
	  (x1-x2) /= 1 &
	  (x1-x2) /= 2 &
	  (x1-x2) /= 3)
  THEN 
      res := TRUE
  ELSE
      res := FALSE
 END;
 IncBound = BEGIN bound := bound+1 END
END

