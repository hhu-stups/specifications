MACHINE WhileSlow // Operation_FindLoop
CONSTANTS
V_Track, DVT
PROPERTIES
 V_Track = %x.(x: 1..1000| x + 1) \/ {(800,1)} &
 DVT = dom(V_Track)
DEFINITIONS
 CHOOSE(X) == ["a member of X"];
 EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T);
 SET_PREF_TIME_OUT == 500000;
  cls(t) == closure1(V_Track)[{t}];
  "LibraryIO.def"
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
       PRINTF(" n = ~w~n",n);maxNumberOfTransitions := (n *(n-1))/2 END;
       WHILE queue /= {}
       DO
         VAR route, last_element, next
         IN
           route := vprintf("chosen = ~w~n",CHOOSE(queue)); 
           last_element := vprintf("last = ~w~n",last(route));
           next := vprintf("next= ~w~n",V_Track[{last_element}]);
           transitions := transitions \/ {l,n|l=last_element&n:next};
                             //({last_element}*next); 
                          // slows down further ?? UNION(e).(e : next | {last_element |-> e});
           IF(#e.(e: next & e : ran(route)))
           THEN
             res := route <- vprintf("chosen2 = ~w~n",CHOOSE({e| e: next & e : ran(route)}));
             queue := {}
           ELSE
             queue := (queue\{route}) \/ vprintf("un2 = ~w~n",UNION(e).(e : next & e : DVT| {route <- e}))
           END//IF
         END//VAR
       INVARIANT 1=1
       VARIANT maxNumberOfTransitions - vprintf("card=~w~n",card(vprintf("trans_for_card",transitions)))
       END//WHILE
     END //VAR
   END //ANY
END
