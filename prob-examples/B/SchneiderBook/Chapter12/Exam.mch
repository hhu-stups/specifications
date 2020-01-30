MACHINE           Exam

SETS              CANDIDATE

VARIABLES         marks

INVARIANT         marks : CANDIDATE +-> 0..100

INITIALISATION    marks := {}

OPERATIONS

  enter(cc,nn) =
  PRE cc : CANDIDATE & cc /: dom(marks) & nn : 0..100
  THEN marks(cc) := nn
  END;

aa <-- average =
  PRE marks /= {}
  THEN aa := (SIGMA zz . (zz : dom(marks) | marks(zz))) / card(dom(marks)) 
  END;

nn <-- number =
  nn := card(dom(marks))

END
