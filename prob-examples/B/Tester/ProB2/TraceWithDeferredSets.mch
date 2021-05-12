MACHINE TraceWithDeferredSets
SETS ID
CONSTANTS val
PROPERTIES card(ID)=5 &
  val: ID --> 1..card(ID)
VARIABLES active, s
INVARIANT  active <: ID &
  s:NATURAL
INITIALISATION
  active,s : 
   (active<:ID & s = SIGMA(i).(i:active|val(i)))
OPERATIONS
  add(a) = PRE a /: active THEN
    active := active \/ {a} ||
    s := s + val(a)
  END 
END