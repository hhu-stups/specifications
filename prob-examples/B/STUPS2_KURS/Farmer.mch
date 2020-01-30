MACHINE Farmer
SETS
 Objekte={fox, chicken, grain,farmer_boat}
DEFINITIONS 
  GOAL == (links = {});
  ok2(Menge) == (eats[Menge] /\ Menge = {});
  ok(Menge) == !(x,y).(x:Objekte & y:Objekte & x:Menge & y:Menge => x|->y /: eats)
CONSTANTS
  eats
PROPERTIES
  eats: Objekte <-> Objekte &
  eats = { fox |-> chicken, chicken |-> grain}
VARIABLES links,rechts
INVARIANT
 links <: Objekte & rechts<:Objekte &
 links \/ rechts = Objekte & links /\ rechts = {} &
 (farmer_boat:links => ok(rechts)) &
 (farmer_boat:rechts => ok(links))
INITIALISATION links := Objekte || rechts := {}
OPERATIONS
  links_nach_rechts(o,nl) = PRE farmer_boat : links & o:Objekte & o: links &
             nl = links-{o,farmer_boat} & ok(nl) THEN
      links,rechts := links - {o,farmer_boat}, rechts \/ {o,farmer_boat}
  END;
  rechts_nach_links(o,nr) = PRE farmer_boat : rechts & o:Objekte & o: rechts &
             nr = rechts-{o,farmer_boat} & ok(nr)   THEN
      rechts,links := rechts - {o,farmer_boat}, links \/ {o,farmer_boat}
  END;
  success = PRE links={} THEN skip END
END

