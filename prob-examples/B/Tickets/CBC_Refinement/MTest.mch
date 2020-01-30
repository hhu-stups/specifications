
MACHINE MTest
  /* the CBC Invariant checking fails to find a counter example here */

SETS /* deferred */
  TOKEN
 ; /* enumerated */
  ACTIVITY={ACTIVITY1};
  ROOM={ROOM1};
  USER={USER1,USER2}  /* with one USER we find a counter example */
CONCRETE_CONSTANTS
  takeplace,
  holder,
  room
ABSTRACT_VARIABLES
  authorised,
  location,
  valid
PROPERTIES
    /* @axm2 */ takeplace = ROOM * ACTIVITY
  & /* @axm1 */ room : TOKEN --> ROOM
  & /* @axm2 */ holder : TOKEN --> USER
INVARIANT
    /* @inv2 */ location : USER +-> ROOM
  & /* @inv3 */ !(u,r).(r : ROOM & (u : dom(location) & location(u) = r) => takeplace[{r}] <: authorised[{u}])
  & /* @inv5 */ !(t).(t : valid => takeplace[{room(t)}] <: authorised[{holder(t)}])
INITIALISATION
     BEGIN
         authorised := {}
      ||
         location := {}
      ||
         valid := {}
    END
OPERATIONS
  RemAuth(a,u) =  SELECT
        /* @grd1 */ u |-> a : authorised
      & (/* @grd2 */ u : dom(location) => (location(u) |-> a) /: takeplace)
    THEN 
         authorised := authorised \ {u |-> a}
    END
END
