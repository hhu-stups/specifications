MODEL
   Exp
CONSTANTS x,y
PROPERTIES x:INTEGER & y:NATURAL
VARIABLES res,remy
INVARIANT res:INTEGER & remy:NATURAL & x**y = res * x**remy
INITIALISATION res,remy := 1,y
OPERATIONS
   Step = PRE remy>0 THEN
     remy,res := remy-1,res*x
   END;
   Finished = PRE remy<=0 THEN
    skip
   END
END