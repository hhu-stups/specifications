MACHINE SetGame

SETS 
    FARBE={rot,blau,gruen}; 
    FORM={ellipse,rechteck,schlange}; 
    ANZAHL={A1,A2,A3};
    FUELLUNG={leer,gepunktet,voll}

CONSTANTS KARTEN

PROPERTIES KARTEN=  FARBE*FORM*ANZAHL*FUELLUNG /* 1..81 */

VARIABLES rest,tisch

INVARIANT 
 tisch<:KARTEN & rest<:KARTEN & 
 rest \/ tisch = KARTEN & rest /\ tisch = {} 

INITIALISATION rest,tisch := KARTEN,{}
OPERATIONS
 start(x) =PRE x<:rest & card(x)=12 THEN tisch,rest:=x,rest-x END
/* start = ANY x WHERE x<:rest & card(x)=2 THEN tisch,rest:=x,rest-x END */
END 