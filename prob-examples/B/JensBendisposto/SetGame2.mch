MACHINE SetGame

SETS 
    FARBE={rot,blau,gruen}; 
    FORM={ellipse,rechteck,schlange}; 
    ANZAHL={A1,A2,A3};
    FUELLUNG={leer,gepunktet,voll}

CONSTANTS KARTEN

PROPERTIES KARTEN=FARBE*FORM*ANZAHL*FUELLUNG

VARIABLES rest,tisch,nr

INVARIANT 
 tisch<:KARTEN & rest<:KARTEN & 
 /* rest \/ tisch = KARTEN & rest /\ tisch = {}  & */
 nr = card(rest)

INITIALISATION rest,tisch,nr := KARTEN,{},card(KARTEN)
OPERATIONS
 /* start = ANY x WHERE x<:rest & card(x)=1 THEN tisch,rest:=x,rest-x END */
 
 draw(x) = PRE x:rest THEN tisch,rest,nr:=rest \/{x},rest-{x},nr-1 END;
 iscard(x) = PRE x:rest THEN skip END
END 