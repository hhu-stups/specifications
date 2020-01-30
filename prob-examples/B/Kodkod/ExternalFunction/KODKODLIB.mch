MACHINE T
DEFINITIONS
      Mx==40;
      Nodes == 0..(Mx-1);
      RelevantNodes == (dom(graph1)\/dom(graph2)\/ran(graph1)\/ran(graph2));
      
      SET_PREF_TIME_OUT == 6000;
      SET_PREF_KODKOD == FALSE;
      SET_PREF_KODKOD_MAX_NR_SOLS == 1;
      SET_PREF_KODKOD_SAT_SOLVER == "sat4j";
      SET_PREF_KODKOD_SYMMETRY == 20;
      EXTERNAL_PREDICATE_KODKOD(T1,T2) == INTEGER*T1*T2*BOOL;
      KODKOD(ID,Ids,WaitIds,BoolExpr)==BoolExpr=TRUE;
      EXTERNAL_PREDICATE_KODKOD_SOLVE(T1,T2) == INTEGER*T1*T2;
      KODKOD_SOLVE(ID,Ids,WaitIds)==(1=1)
END