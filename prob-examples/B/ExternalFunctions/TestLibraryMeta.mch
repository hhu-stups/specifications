MACHINE TestLibraryMeta
DEFINITIONS
 "LibraryMeta.def";
 OutDegree == card({i| i:INTEGER & STATE_SUCC (CURRENT_STATE_ID,i)});
 OutDegreeOp(Op) == card({i| i:INTEGER & STATE_TRANS(CURRENT_STATE_ID,Op,i)});
 SET_PREF_MAX_OPERATIONS == 15
ASSERTIONS
  OutDegree >0;
  OutDegree <10 ;
  OutDegreeOp("Inc") < 2;
  PROJECT_STATISTICS("constants")=0;
  PROJECT_STATISTICS("variables")=1;
  PROJECT_STATISTICS("invariants")=1;
  PROJECT_STATISTICS("operations")=2;
  MACHINE_INFO("TestLibraryMeta","TYPE")="abstract_machine";
  PROJECT_INFO("sha-hash") /= {""}
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Inc = PRE xx<10 THEN xx:=xx+1 END;
//  IncBy(z) = PRE xx+z<10 & z>0 THEN xx:=xx+z END;
  Dec = PRE xx>0 THEN xx :: (0..xx-1) END
END
