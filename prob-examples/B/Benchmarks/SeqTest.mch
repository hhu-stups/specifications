MACHINE SeqTest
DEFINITIONS SET_PREF_MAXINT == 3
SETS
  SA = {a,b}
  
CONSTANTS
  ii
  
PROPERTIES
 /* ss: seq(SA) & */
 <> : dom(ii) & 
 ii(<>) = id(SA) & /*  if you move it after the typing: takes very long time with abort checking on!!
  + new kernel does not work !*/

  ii: seq(SA) +-> (SA<->SA)

/* & ii(<>) = id(SA) */

OPERATIONS
  rr <-- get_rel(ss) = PRE ss: seq(SA) & ss: dom(ii) THEN
                   rr := ii(ss)
                END
END