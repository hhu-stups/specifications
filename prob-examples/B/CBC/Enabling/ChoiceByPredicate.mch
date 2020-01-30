MACHINE ChoiceByPredicate
VARIABLES x
INVARIANT
x:INTEGER
INITIALISATION x:=0
OPERATIONS
 enable_choice = x:=x+1;
 choice = x: (x$0 >= 1 & x=x$0+1)
 /* ProB does not recognise that enable 
    choice write a variable read in the "guard" of choice.
  b_get_read_write returns x$0 as result for the read set in the guard of the operation */
END