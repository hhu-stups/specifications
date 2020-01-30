MACHINE          PARKING
CONSTANTS        NbPlaces
PROPERTIES       NbPlaces : NAT
VARIABLES        VehiculesPres
INVARIANT        VehiculesPres : 0..NbPlaces
INITIALISATION   VehiculesPres := 0 
OPERATIONS
  entrer =       SELECT VehiculesPres < NbPlaces THEN VehiculesPres := VehiculesPres + 1 END;
  sortir =       SELECT VehiculesPres > 0 THEN VehiculesPres := VehiculesPres - 1 END
END