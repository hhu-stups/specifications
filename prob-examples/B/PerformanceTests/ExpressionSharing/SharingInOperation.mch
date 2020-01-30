MACHINE SharingInOperation
/* In the operation below an expression ({x|x:1..sz & x mod a = 2}) appears three times */
/* Check if expression sharing can ensure that it is computed just
   once */
DEFINITIONS
  GOAL == (sz>30000)
CONSTANTS a
PROPERTIES a = 100
VARIABLES sz, set, crd
INVARIANT
 sz:NATURAL & set <: INTEGER & crd:INTEGER
INITIALISATION sz,set,crd := 0,{},0
OPERATIONS
  Step =   sz := sz + a ||
          set := {x|x:1..sz & x mod a = 2} \/
                 {x|x:1..sz & x mod a = 2}  /* by replacing 2 by 1+1: perormance *is* affected */
         ||
          crd := card({x|x:1..sz & x mod a = 2})  /* by replacing 2 by 1+1: performance not affected */
END

