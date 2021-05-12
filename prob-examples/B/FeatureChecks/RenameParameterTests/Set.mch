MACHINE
   Set(ELEM)
CONSTANTS maxel
PROPERTIES maxel:NATURAL1
VARIABLES
   set
INVARIANT set<:ELEM
INITIALISATION set := {}
OPERATIONS
  add(e) = PRE e:ELEM THEN
     SELECT e/:set & card(set)<maxel THEN
       set := set \/ {e}
     END
 END;
  del(e) = PRE e:ELEM THEN
     SELECT e:set THEN
       set := set - {e}
     END
  END
END