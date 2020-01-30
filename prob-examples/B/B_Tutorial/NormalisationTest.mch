MACHINE NormalisationTest
 /* to test out the behaviour of state normalisation in ProB */
SETS
  UID = {ua,ub,uc}
  
VARIABLES
  uu, su
  
INVARIANT
  uu: POW(UID) & su: POW(POW(UID))
  
INITIALISATION
  uu:= {ub,uc} || su := { ss | ss:POW(UID) & card(ss)=2}
  
OPERATIONS
  set_uu(xx,yy) = PRE xx:UID & yy:UID & 
                  (xx=ub or xx=uc) & (yy=ub or yy=uc) & xx/= yy THEN
                 uu := {xx,yy}
               END;
  set_su1 = BEGIN su := { {ua,ub}, {ua,uc}, {ub,uc} } END;
  set_su2 = BEGIN su := { {uc,ub}, {ub,ua}, {ua,uc} } END
END