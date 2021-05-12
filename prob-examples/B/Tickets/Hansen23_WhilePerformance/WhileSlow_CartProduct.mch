MACHINE WhileSlow_CartProduct // Operation_FindLoop; 12.8 seconds
CONSTANTS
V_Track, DVT
PROPERTIES
 V_Track = %x.(x: 1..1000| x + 1) \/ {(800,1)} &
 DVT = dom(V_Track)
DEFINITIONS
 CHOOSE(X) == ["a member of X"];
 EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T);
 SET_PREF_TIME_OUT == 18500;
  cls(t) == closure1(V_Track)[{t}];
  "LibraryIO.def";
  "LibraryMeta.def";
   svprintf(s,val) == val;
   svprintf1(s,val) == vprintf(s,val)
OPERATIONS
 res <-- FindLoop =
   ANY t
   WHERE
     t : DVT
     & t : cls(t)
     & t = 1
     & SET_PREF("printf_stats","TRUE")
   THEN
     VAR queue, transitions, maxNumberOfTransitions
     IN
       queue := {[t]};
       transitions := {};
       LET n BE n = card(cls(t)) + 1 IN
       PRINTF(" n = ~w~n",[n]);maxNumberOfTransitions := (n *(n-1))/2 END;
       WHILE queue /= {}
       DO
         VAR route, last_element, next
         IN
           route := svprintf("chosen = ~w~n",CHOOSE(queue));
           last_element := svprintf("last = ~w~n",last(route));
           next := svprintf("next= ~w~n",V_Track[{last_element}]);
           transitions := transitions \/ ({last_element}*next); // using cartesian product here
                          //  UNION(e).(e : next | {last_element |-> e});
           IF(#e.(e: next & e : ran(route)))
           THEN
             res := route <- svprintf("chosen2 = ~w~n",CHOOSE({e| e: next & e : ran(route)}));
             queue := {}
           ELSE
             queue := (queue\{route}) \/ svprintf("un2 = ~w~n",UNION(e).(e : next & e : DVT| {route <- e}))
           END//IF
         END//VAR
       INVARIANT 1=1
       VARIANT maxNumberOfTransitions - svprintf("card=~w~n",card(svprintf("trans_for_card ",transitions)))
       END//WHILE
     END //VAR
   END //ANY
END
