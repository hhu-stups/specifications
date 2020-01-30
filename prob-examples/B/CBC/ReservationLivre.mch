MACHINE ReservationLivre
SETS
  UTIL;LIVRES
DEFINITIONS
  scope_UTIL == 20; scope_LIVRES==20 /* check that we find CBC counter-example with large scope */
VARIABLES emprunt, reservation
INVARIANT
 emprunt: LIVRES +-> UTIL &
 reservation: LIVRES <-> UTIL &
 emprunt /\ reservation = {}
INITIALISATION
 emprunt,reservation := {},{}
OPERATIONS
 Add_reservation(lec,livre) = PRE lec:UTIL & livre:LIVRES THEN
	reservation := reservation \/ {livre |-> lec}
 END
END