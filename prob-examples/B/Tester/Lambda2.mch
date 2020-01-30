MACHINE Lambda2
/* This machine requires the "lazy expansion of lambdas and set comprehension" to be turned on */
SETS
   COLOURS = {red,green,blue,violet}
   
CONSTANTS
  mynumbers
  
PROPERTIES
   mynumbers: POW(NAT) & 
   mynumbers = {xx | xx:NAT & xx>0 & xx<5}
   
VARIABLES
   col1,pf, inc, ival, pfdom, gen_inc
   
INVARIANT
   col1 : COLOURS  &
   pf : COLOURS +-> COLOURS & pfdom : POW(COLOURS) &
   
   inc : NAT +-> NAT & ival: NAT &
   
   gen_inc: NAT +-> (NAT +-> NAT)
   
   
   
INITIALISATION
   col1 := red ||
   pf := {} ||
   pfdom := {} ||
   inc := %xx.(xx:NAT|xx+1) ||
   ival := 3 ||
   gen_inc := %ii.(ii:NAT|  %xx.(xx:NAT|xx+ii) )
   
OPERATIONS

   define_pf = BEGIN
      pf := %xx.(xx:COLOURS|red)||
      pfdom := COLOURS
    END;
    
   define_pf2 = BEGIN
      pf := {x1,x2|x1:COLOURS & x2: COLOURS & x1 /= x2} ||
      pfdom := COLOURS
    END;
    
    rr <-- ApplyPF(xx) = PRE xx:COLOURS & xx: pfdom THEN
     rr := pf(xx)
    END;
    
    rr <-- ApplyInc(xx) = PRE xx:NAT THEN rr := inc(xx) END;
    
    UpdateInc(xx) = PRE xx: NAT & xx>0 & xx<3 THEN
      inc := %yy.(yy:NAT|xx+ival+yy)
    END; 
    
    GenInc(xx) = PRE xx: NAT THEN inc := gen_inc(xx) END;
    
    IncRel(xx,yy) = PRE xx:NAT & yy:NAT & (xx |-> yy) : inc THEN
      skip
    END;
    
    MyNumber(xx) = PRE xx: NAT & xx: mynumbers THEN skip END
    
END
    