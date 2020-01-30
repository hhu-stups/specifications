MACHINE Sets

SETS
   setX = {x1,x2,x3,x4};
   setY = {y1,y2,y3,y4}

VARIABLES
    funX,
    valX,
    valY

INVARIANT
   funX : setX +-> setY &
   valX : POW(setX) &
   valY : POW(setY)

INITIALISATION
    funX := {x1 |-> y1} ||  /* or use funX : ( funX : setX +-> setY ) */
    valX :: POW(setX) ||
    valY := {y1}

OPERATIONS

   addX(xx) =
        PRE xx:setX & xx/:dom(funX)
        THEN
          ANY yy WHERE yy:setY & yy/:ran(funX)
          THEN
            funX(xx) := yy
          END
        END; 

    res <-- unionS =
        ANY ss WHERE ss: POW(setX) &  ss <: setX & {xx | xx: setX & xx:ss & xx/:dom(funX)} = ss
        /* does not seem to work properly ? because ss used in set comprehension itself ?
           no: because ss is not enumerated ?! */
        THEN
         /* valX := valX \/ ss ||*/
          res := ss
        END;
    res <-- unionS_para(ss) =
        PRE ss: POW(setX) &  ss <: setX & {xx | xx: setX & xx:ss & xx/:dom(funX)} = ss
        /* This does work: as ss is now properly enumerated ! */
        THEN
         /* valX := valX \/ ss ||*/
          res := ss
        END;
        
    res <-- unionS2 =
        ANY ss WHERE ss: POW(setX) &  {xx | xx: setX & xx/:dom(funX)} = ss
        THEN
         /* valX := valX \/ ss ||*/
          res := ss
        END;
   
   res <-- GenUnion =
        BEGIN
          res := union({valX, {x1} })
        END;
   res <-- GenInter =
        BEGIN
          res := inter({valX, setX, {x1,x2,x3} })
        END


END

