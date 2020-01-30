MACHINE Sets

SETS
   setX = {x1,x2,x3}

VARIABLES
    xx

INVARIANT
   xx : POW(setX) 

INITIALISATION

    xx := {x1,x2}

OPERATIONS
   all(ss) = PRE ss /\ xx = {} & ss:POW(setX) &  card(ss) = 1 THEN skip END;
   not_in21a(ss) = PRE xx - ss = {x2,x1} & ss: POW(setX) & card(ss) = 1 THEN skip END;
   not_in21b(ss) = PRE xx - ss = {x1,x2} & ss: POW(setX) & card(ss) = 1 THEN skip END;
   
   inter_testa(ss) = PRE xx /\ ss = {x2,x1} & ss: POW(setX) & card(ss) = 2 THEN skip END;
   inter_testb(ss) = PRE xx /\ ss = {x1,x2} & ss: POW(setX) & card(ss) = 2 THEN skip END;
   
   rem_testa(sss) = PRE sss <: POW(setX) & sss - {xx} = {} & sss = {{x1,x2}} THEN skip END;
   rem_testb(sss) = PRE sss <: POW(setX) & sss - {xx} = {} & sss = {{x2,x1}} THEN skip END
  

END

