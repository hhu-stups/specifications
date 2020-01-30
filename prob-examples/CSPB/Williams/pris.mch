MACHINE pris /* MutualExclusion */
DEFINITIONS
ASSERT_LTL_1 == "F[Done]";
ASSERT_LTL_2 == "WF(In.p1) & WF(In.p2) & WF(In.p3) => F[Done]";
ASSERT_LTL_3 == "(FG e(In.p1) => GF [In.p1]) & (FG e(In.p2) => GF [In.p2]) & (FG e(In.p3) => GF [In.p3]) => F[Done]";
ASSERT_LTL_4 == "SF(In.p1) & SF(In.p2) & SF(In.p3) => F[Done]";
ASSERT_LTL_5 == "(GF e(In.p1) => GF [In.p1]) & (GF e(In.p2) => GF [In.p2]) & (GF e(In.p3) => GF [In.p3]) => F[Done]";

SETS
 AGENTS={p1,p2,p3}
VARIABLES y, cnt
INVARIANT
 y:NAT & y<2 & cnt:NAT & cnt<3
INITIALISATION
 y:=0 || cnt:=0
OPERATIONS
  In(nn) = PRE cnt<2 & nn : AGENTS THEN skip END;
  Enter(vv) = PRE cnt<2 & vv=y THEN skip END;
  Leave(vv) = PRE cnt<2 & vv : NAT THEN 
		  IF vv<y 
		  THEN y := vv || cnt:=cnt+1
		  ELSE y := vv END
		END;
  Done = PRE cnt>1 THEN skip END

END
