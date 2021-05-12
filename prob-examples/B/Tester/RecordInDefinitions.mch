MACHINE RecordInDefinitions
DEFINITIONS
  get_id(rr) == rr'rid; // type of rr depends on argument, must have at least field rid
  get_name(rr) == rr'name;
  SET_PREF_TYPE_CHECK_DEFINITIONS == TRUE
SETS
 ID={aa,bb}
CONSTANTS r1,r2,r3, r4,r5
PROPERTIES
 r1:struct(rid:NATURAL,name:STRING) &
 r2:struct(name:STRING,rid:INTEGER) &
 r3:struct(rid:NATURAL1) &

 get_id(r1) = get_id(r2) &
 get_id(r2) = get_id(r3) &
 get_id(r3) = 127 &
 r1'name = "peter" &
 get_name(r2) = "mary" &

 LET nm BE nm=r4'name IN
   get_name(r2) = nm &
   get_name(r5) = nm &
   r4 = rec(suc:127,name:nm,rid:7)
 END
 & r5 = rec(anc:127,name:r5'name,rid:7)
ASSERTIONS
  r1'name ="peter";
  r2'name ="mary";
  r5'name ="mary";
  r4=rec(name:"mary",suc:127,rid:7);
  r5=rec(name:"mary",anc:127,rid:7)
VARIABLES xx
INVARIANT
 xx:struct(name:STRING,rid:INTEGER)
INITIALISATION xx:=r2
OPERATIONS
  Set = BEGIN xx := r1 END
END

