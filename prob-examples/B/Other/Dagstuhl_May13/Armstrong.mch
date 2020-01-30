MACHINE Armstrong
DEFINITIONS
 A==(a=TRUE);
 B==(b=TRUE);
 C==(c=TRUE);
 D==(d=TRUE);
 E==(e=TRUE);
 F==(f=TRUE);
VARIABLES a,b,c,d,e,f
INVARIANT
 ((A & B) => C) &
 (C => A) &
 ((B & C) => D ) &
 ((A& C& D) => B ) &
 ((B & E) => C) &
 ((C & E) => (F & A)) &
 ((C & F) => (B & D)) &
 (D => (E& F))
INITIALISATION a,b,c,d,e,f := TRUE,TRUE,TRUE,TRUE,TRUE,TRUE
END

