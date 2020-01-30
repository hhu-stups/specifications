MACHINE UnsatCore /* test that ProB's deferred setsize set up can deal with this */
SETS /* deferred */
  GlobalLocations;
  Connections;
  Hubs;
  Nets;
  Vehicles
CONSTANTS CLocations, HLocations, connectionLocations, hubLocations
PROPERTIES
 //card(GlobalLocations) = 6 &
 card(GlobalLocations) >= card(Hubs) + card(Connections) &
 //card(GlobalLocations) >= 6 &
 (CLocations : POW(GlobalLocations) & HLocations : POW(GlobalLocations)) & 
(((GlobalLocations = CLocations\/HLocations & CLocations/\HLocations = {}) &
 /* @Location:type-hubLocations  */ hubLocations : Hubs >-> HLocations) & 
 /* @Location:type-connectionLocations  */ connectionLocations : Connections >-> CLocations)
END
