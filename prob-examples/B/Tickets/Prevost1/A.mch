MACHINE A SEES C
VARIABLES d, vv
INVARIANT
 d:ID & vv:ID
INITIALISATION d:=aa || vv := bb
END

 /* PROB NOW REPORTS identifier declared twice; but this is correct */