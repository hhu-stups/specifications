MACHINE Armstrong2
/* page 13 of slides 13211.ThalheimBernhard.Slides */
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
 ((C& D) => B ) &  /* REDUNDANT */
 ((B & E) => C) &
 ((C & E) => (F)) &
 ((C & F) => (B)) &
 (D => (E& F))
INITIALISATION a,b,c,d,e,f := TRUE,TRUE,TRUE,TRUE,TRUE,TRUE
END

