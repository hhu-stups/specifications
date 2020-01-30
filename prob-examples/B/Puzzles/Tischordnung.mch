MACHINE Tischordnung
/* Puzzle taken from Think - Denksport Game */
SETS
 ID={Peter,Gabi,Ute,Heinz,Paula}
CONSTANTS u_avoid, d_avoid, order
PROPERTIES
 /* the undirected conflict relation */
 u_avoid : ID <-> ID &
 u_avoid = { Peter |-> Ute,
           Gabi |-> Heinz, Gabi |-> Ute,
           Ute |-> Paula, Gabi |-> Paula} &
 /* the directed version; one conflict holds only in one direction */
 d_avoid = u_avoid \/ u_avoid~ \/ {Paula |-> Heinz} &
 order : perm(ID) &
 !i.(i:1..(size(order)-1) => order(i)|->order(i+1) /: d_avoid)
OPERATIONS
  r <-- Get(yy) = PRE yy:dom(order) THEN r:= order(yy) END
END

