/*
* Taken from ClearSy - Modelling in B Tutorial
* see http://www.tools.clearsy.com/wp1/?page_id=161
*/

MACHINE utils

OPERATIONS
   rr <-- minimum(aa, bb) =
   PRE
       aa: NAT &
       bb: NAT
   THEN
       rr := min({aa, bb})
   END;

   rr <-- maximum(aa, bb, cc) =
   PRE
       aa: NAT &
       bb: NAT &
       cc: NAT
   THEN
       rr := max({aa, bb, cc})
   END
END