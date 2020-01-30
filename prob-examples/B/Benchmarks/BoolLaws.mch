MACHINE BoolLaws
CONSTANTS
    TT,FF
PROPERTIES
    FF:BOOL & FF=FALSE & TT:BOOL & TT=TRUE
VARIABLES
    PP, QQ, RR
DEFINITIONS
  pt == (PP=TRUE);
  qt == (QQ=TRUE);
  rt == (RR=TRUE);
  tr == (TT=TT);
  fail == (TT=FF);
INVARIANT
   PP:BOOL & QQ:BOOL & RR:BOOL &
    ((pt & qt) <=> (qt & pt))&
    (pt or not(pt)) &
    not(pt & not(pt)) &
    ((pt & fail) <=> fail) &
    ((pt or fail) <=> pt) &
    ((pt or tr) <=> tr) &
    ((pt & tr) <=> pt) &
    (((pt => qt) & (qt => rt)) => (pt => rt)) &
    (((pt <=> qt) & (qt <=> rt)) => (pt <=> rt)) &
    ((pt <=> qt) => (pt => qt)) &
    ((pt <=> qt) => (qt => pt)) &
    ((pt <=> qt) <=> ((pt => qt) & (qt => pt))) &
   ((pt or qt) <=> (qt or pt)) &
   ((pt) <=> (not(not(pt)))) &
    tr &
    not(fail)
INITIALISATION

    PP,QQ,RR := FALSE,FALSE,FALSE

OPERATIONS
 set_pp = BEGIN PP:=TRUE END;
 set_qq = BEGIN QQ:=TRUE END;
 set_rr = BEGIN RR:=TRUE END

END

