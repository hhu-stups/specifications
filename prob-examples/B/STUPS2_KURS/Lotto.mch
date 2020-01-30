MACHINE Lotto
VARIABLES drawn
INVARIANT
 drawn<:1..49
INITIALISATION drawn:={}
OPERATIONS
  DrawOneNr= PRE card(drawn)<6 THEN
             ANY nr WHERE nr:1..49 & nr/:drawn THEN
               drawn := drawn \/ {nr}
             END
           END;
 DrawSix = PRE drawn={} THEN
             ANY ss WHERE ss<:1..49 & card(ss) = 6 THEN
              drawn := ss
             END
           END
END

