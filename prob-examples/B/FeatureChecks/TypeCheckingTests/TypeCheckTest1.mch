MACHINE TypeCheckTest1
SETS
 ID={aa,bb}
CONSTANTS s,r
PROPERTIES
 s:seq(ID) & r: ID+->ID & size(s)>0 & card(r)>0
VARIABLES x,y
INVARIANT
 x:ID & x /= first(s) &
   x /= last(r) /* Type Error now detected */ &
   s = front(r) /* type error also detected */ &
  y:NAT
INITIALISATION x:=aa || y := 1
OPERATIONS
  Set(yy) = PRE yy:ID THEN x:= yy END;
  SetBoth = BEGIN x := 1 ||
                  y := x END;

  SetBoth2 = BEGIN 
    x,y := aa,1
  END
END

