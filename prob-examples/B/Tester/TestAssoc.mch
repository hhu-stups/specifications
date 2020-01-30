MODEL
   TestAssoc
   /* Test whether associativity of cartesian product, |-> and ( , ... ,) is ok */
SETS ID = {a,b,c}
VARIABLES f,g,h,x
INVARIANT
  f : ID*ID*ID +-> ID  & g : (ID*ID)*ID +-> ID & h : ID*(ID*ID)+-> ID & x:ID
INITIALISATION
  f := { a|->b|->a |-> c, (a|->a)|->b |->c } ||
  g := { a|->b|->a |-> c, (a|->a)|->b |->c } ||
  h := { a|->(b|->a) |-> c, a|->(a|->b) |->c } ||
  x:= a
OPERATIONS
 /*
 errf = BEGIN
     f := { a|->(b|->a) |-> c, a|->(a|->b) |->c }  detected by ProB
  END;
  errh = BEGIN
     h := { a|->b|->a |-> c, (a|->a)|->b |->c } detected by ProB
  END;
*/
  applyf(a1,a2,a3) = PRE a1:ID & a2:ID & a3:ID & a1|->a2|->a3 : dom(f) THEN
    x:= f(a1,a2,a3)
  END
END