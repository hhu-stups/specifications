MACHINE           Team
DEFINITIONS
  SET_PREF_MAXINT == 22;
  SET_PREF_MAX_OPERATIONS == 150
SETS              ANSWER = {in, out}

VARIABLES         team

INVARIANT         team <: 1..22 & card(team) = 11

INITIALISATION    team := 1..11

OPERATIONS

  substitute(pp,rr) =
  PRE pp : team & rr : 1..22 & rr /: team  /* PRE needs to be added for ProB */
  THEN team := (team \/ {rr}) - {pp}
  END;

aa <-- query(pp) =
  PRE pp : 1..22
  THEN IF pp : team 
       THEN aa := in
       ELSE aa := out
       END
  END

END
