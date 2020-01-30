MACHINE Airport
SETS
  Aircraft
DEFINITIONS Airport == struct(permission:POW(Aircraft),landed:POW(Aircraft));
            Airport_inv(a) == (a'landed <: a'permission);
            permitted(a,p) == (a : p);
            down(a,land) == (a:land);
            PreRecordLanding(a,p,l) == (permitted(a,p) & not(down(a,l)))
VARIABLES a
INVARIANT
   a:Airport & Airport_inv(a)
INITIALISATION a:(a'permission = {} & Airport_inv(a))
OPERATIONS
  GivePermission(ac) = PRE ac:Aircraft & ac /: a'permission THEN
     a : ( /* POST CONDITION: */
           a'landed = a$0'landed &  a'permission = a$0'permission \/ {ac} & Airport_inv(a))
  END;
  RecordLanding(ac) = PRE ac:Aircraft & PreRecordLanding(ac,a'permission,a'landed)  /* the VDM has a mistake here: permission and landed are swapped leading to a deadlock */ THEN
     a : ( /* POST CONDITION */
           a'landed = a$0'landed \/ {ac} &
           a'permission = a$0'permission  & Airport_inv(a) )
  END;
  RecordTakeOff(ac) = PRE ac:Aircraft & down(ac,a'landed)  THEN
     a : ( /* POST CONDITION */
           a'landed = a$0'landed - {ac} &
           a'permission = a$0'permission - {ac} )
  END;
  r <-- NumberWaiting = BEGIN r := card(a'permission \ a'landed) END
END

