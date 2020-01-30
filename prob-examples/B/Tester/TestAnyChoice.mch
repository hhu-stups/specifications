MACHINE TestAnyChoice
// Try and write an operation that returns counter-examples to properties and result whether a counter-example exists
// we also test whether a definition can be used inside a universal quantification at the top-level
CONSTANTS f,g
PROPERTIES
 f  = [1,2,3,4,5,6,7,8] &
 g  = [1,2,3,3,4,5,6,7,7]
DEFINITIONS
  // NInj(xx) == i:dom(xx) & j:dom(xx) & i<j & xx(i)=xx(j);
  Inj(xx) == (i:dom(xx) & j:dom(xx) & i<j => xx(i)/=xx(j))
OPERATIONS
  r <-- Check_inj_f = 
    CHOICE
      ANY i,j WHERE not(Inj(f)) THEN r := ("Not injective at: ",i,j) END 
    OR
      SELECT !(i,j).(Inj(f)) THEN  r := ("OK: injective",0,0) END
    END;
  r <-- Check_inj_g = 
    CHOICE
      ANY i,j WHERE not(Inj(g)) THEN r := ("Not injective at: ",i,j) END 
    OR
      SELECT !(i,j).(Inj(g)) THEN  r := ("OK: injective",0,0) END
    END
  /* this does not work
  r <-- Check_Injective_f(i,j) = 
       SELECT i:dom(f) & j:dom(f) & i<j THEN
          IF f(i)=f(j) THEN
             r := FALSE
          ELSE SELECT i=1 & j=2 THEN r:= TRUE END
          END
        END;
  r <-- Check_Injective_g(i,j) = 
       SELECT i:dom(g) & j:dom(g) & i<j THEN
          IF g(i)=g(j) THEN
             r := FALSE
          ELSE SELECT i=1 & j=2 THEN r:= TRUE END
          END
        END */
END

