MACHINE ListsWithInduction
SETS
 A = {a1}; LA /* lists of elements from A */
CONSTANTS nil, cons, lrank
PROPERTIES
 nil:LA &
 cons: (A*LA) +-> LA &  /* function has to be made partial; otherwise we cannot animate
  as we would need an infinite set LA to satisfy the PROPERTIES */
 lrank: LA --> NATURAL &
 lrank(nil) = 0 &
 !x.(x:LA & lrank(x)=0 => x=nil) &
 !(a,la).(a:A & la:LA & a|->la:dom(cons) => lrank(cons(a,la)) = lrank(la)+1)
VARIABLES mylist
INVARIANT
 mylist:LA
INITIALISATION mylist:=nil
OPERATIONS
  Add(xx) = PRE xx:A THEN mylist := cons(xx,mylist) END;
  Pop(xx) = PRE xx:A & mylist /= nil THEN 
              ANY nl WHERE cons(xx,nl) = mylist THEN
                 mylist := nl
              END
            END
END

