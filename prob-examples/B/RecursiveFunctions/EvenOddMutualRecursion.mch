MACHINE EvenOddMutualRecursion
/* A proposal on how to define mutually recursive functions */
ABSTRACT_CONSTANTS even,odd
PROPERTIES
  even: INTEGER <-> BOOL & odd: INTEGER <-> BOOL &
  (even,odd) =
     ( %x.(x=0|TRUE) \/ %x.(x>0|even(x-1))
      ,
       %y.(y=0|FALSE) \/ %y.(y>0|odd(y-1)) 
     )
END

