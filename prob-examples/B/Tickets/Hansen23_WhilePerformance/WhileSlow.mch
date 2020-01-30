MACHINE WhileSlow // Operation_FindLoop
CONSTANTS
V_Track, cls
PROPERTIES
V_Track = %x.(x: 1..1000| x + 1) \/ {(800,1)}
& cls = UNION(t).(t : dom(V_Track) | {t |-> closure1(V_Track)[{t}]})
DEFINITIONS
 CHOOSE(X) == ["a member of X"];
 EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T);
 SET_PREF_TIME_OUT == 500000
OPERATIONS
 res <-- FindLoop =
   ANY t
   WHERE
     t : dom(V_Track)
     & t : cls(t)
     & t = 1
   THEN
     VAR queue, transitions, maxNumberOfTransitions
     IN
       queue := {[t]};
       transitions := {};
       LET n BE n = card(cls(t)) + 1 IN maxNumberOfTransitions := (n *(n-1))/2 END;
       WHILE queue /= {}
       DO
         VAR route, last_element, next
         IN
           route := CHOOSE(queue);
           last_element := last(route);
           next := V_Track[{last_element}];
           transitions := transitions \/ UNION(e).(e : next | {last_element |-> e});
           IF(#e.(e: next & e : ran(route)))
           THEN
             res := route <- CHOOSE({e| e: next & e : ran(route)});
             queue := {}
           ELSE
             queue := (queue\{route}) \/ UNION(e).(e : next & e : dom(V_Track)| {route <- e})
           END//IF
         END//VAR
       INVARIANT 1=1
       VARIANT maxNumberOfTransitions - card(transitions)
       END//WHILE
     END //VAR
   END //ANY
END
