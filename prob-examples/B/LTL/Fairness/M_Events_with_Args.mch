MACHINE M_Events_with_Args
DEFINITIONS
  ASSERT_LTL == "SF(Evt) => F deadlock(Evt1,Evt2)"
VARIABLES x,y
INVARIANT
 x:INTEGER & y:INTEGER
INITIALISATION x,y:=0,0
OPERATIONS

  Evt1 = PRE x < 3 THEN x := x+1 END;

  Evt2 = PRE x=3 & y < 5 THEN y := 3 END;

  Evt(a) = PRE x=3 & y = 3 & a:{1,2} & y < 10 THEN y:= a+y END;

  Skip = PRE x=3 & y = 5 THEN skip END
END


