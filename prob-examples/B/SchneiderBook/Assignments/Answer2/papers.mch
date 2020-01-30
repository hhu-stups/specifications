MACHINE           Papers

SETS              HOUSE ; RESPONSE = {yes, no}

CONSTANTS         lasthouse

PROPERTIES        lasthouse : NAT1 & 
                  HOUSE = 1..lasthouse

VARIABLES         papers

INVARIANT         papers <: HOUSE 

INITIALISATION    papers := {} 

OPERATIONS

addpaper(pp) =
PRE
  pp : HOUSE 
THEN
  papers := papers \/ {pp}
END;

nn <-- roundsize =
PRE
  true
THEN
  nn := card(papers)
END;

removepaper(pp) =
PRE
  pp : papers
THEN
  papers := papers - {pp}
END;

ans <-- paperquery(pp) =
PRE
  pp : HOUSE
THEN
  IF pp : papers
  THEN ans := yes
  ELSE ans := no
  END
END

END

