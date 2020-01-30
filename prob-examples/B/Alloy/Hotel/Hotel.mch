MACHINE Hotel
/* Translation from VDM hotel.vdmsl model */
SETS
 Key; Room; Guest
DEFINITIONS
   map(X,Y) == X +-> Y;
   set_of(X) == POW(X);
   rng(X) == ran(X);
   subset(X,Y) == (X <: Y);
   dunion(X) == union(X); /* TO DO: add assert */
   munion(X,Y) == (X <+ Y); /* TO DO: add assert */
   
  Desk == struct(issued:set_of(Key), prev:map(Room,Key) );
  Desk_inv(d) == subset(rng(d'prev),d'issued);
  Card == struct(fst:Key, snd:Key)
VARIABLES desk, locks, guests
INVARIANT
   desk : Desk &
   locks : map(Room,Key) &
   guests : map(Guest,set_of(Card)) &
   
   subset(dom(desk'prev),dom(locks)) /* dom h.desk.prev subset dom h.locks  */
   &
  /* subset(dunion(ran(%c.(c:dunion(rng(guests))|{c'fst,c'snd}))),desk'issued) */
   !x.(x:ran(guests) => !c.(c:x => c'fst : desk'issued & c'snd : desk'issued))
      /* dunion {{c.fst, c.snd} | c in set dunion rng h.guests}
         subset h.desk.issued */
   
INITIALISATION
   desk,locks : ( Desk_inv(desk) & desk'issued={} & desk'prev = locks) ||
   guests := {}
OPERATIONS
   CheckIn(g,r) = PRE g:Guest & r:Room &
                       r : dom(desk'prev) THEN  /* r in set dom desk.prev */
        ANY new_k,new_c WHERE new_k /: desk'issued &
              new_c = rec(fst:desk'prev(r),snd:new_k)
          THEN
            desk := rec(issued:desk'issued \/ {new_k}, prev: desk'prev <+ {r|->new_k}) ||
            IF g : dom(guests) THEN
              guests := guests <+ {g |-> (guests(g) \/ {new_c})}
            ELSE
              guests := munion(guests,{g |-> {new_c}})
            END
        END
   END;
   
   res <-- IssueCard =
     ANY k WHERE k:Key & k /: desk'issued THEN /* let k: Key be st k not in set desk.issued */
       desk := rec(prev:desk'prev, issued:desk'issued \/ {k}) ||  /* (desk.issued := desk.issued union {k}; */
       res := k
     END;
   AddRoom(r,k) = PRE r:Room & k:Key &
       k: desk'issued & r /: dom(locks) /* pre k in set desk.issued and r not in set dom locks; */ 
      THEN
      desk := rec(prev:munion(desk'prev,{r|->k}),issued:desk'issued) || /* desk.prev := desk.prev munion {r |-> k}; */
      locks := munion(locks,{r|->k}) /* locks munion {r |-> k} */
    END
END