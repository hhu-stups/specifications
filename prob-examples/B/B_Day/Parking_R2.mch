MACHINE PARKING_R2
CONSTANTS        NbPlaces
PROPERTIES       NbPlaces : NAT

/*SYSTEM    PARKING_R2
REFINES   PARKING_R1*/

SETS      COULEUR_FEU = {vert, rouge}

VARIABLES VehiculesPres, feu, cc

INVARIANT feu : COULEUR_FEU 
 & ((cc=0 & feu=vert ) => VehiculesPres<NbPlaces)
 & ((cc=0 & feu=rouge) => VehiculesPres=NbPlaces) &
 
 VehiculesPres : 0..NbPlaces & cc: (-1)..1
 
INITIALISATION 
 VehiculesPres:=0 || feu:=vert || cc:=0
 
OPERATIONS

 entrer = SELECT VehiculesPres<NbPlaces & cc=0 
    THEN VehiculesPres,cc:=VehiculesPres+1,1 END;
    
 controler_entree = SELECT cc=1 THEN 
    IF VehiculesPres=NbPlaces THEN feu:=rouge END 
    || cc:=0 END;
    
 sortir = SELECT VehiculesPres>0 & cc=0 THEN VehiculesPres,cc:=VehiculesPres-1,-1 END;
 
 controler_sortie = SELECT cc=-1 THEN feu,cc:=vert,0 END
END