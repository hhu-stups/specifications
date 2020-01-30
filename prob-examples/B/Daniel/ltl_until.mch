MACHINE ltl_until
DEFINITIONS
  /* Wir zählen die Zustände von 1 an durch */
  STATES == (1..full_length);
  /* Eine Vervollständigung ist eine Auswertung auf dem Pfad, die der teilweisen
     Auswertung entspricht (d.h. die teilw. Auswertung ist eine Untermenge der kompletten)
     und beliebig aber komplett auf dem Rest definiert ist
     (d.h. sie ist eine vollständige Funktion auf den Zuständen
  */
  COMPLETION(part,full) == ( full : STATES --> BOOL & part <: full);
  /* Das folgende Prädikat repräsentiert unsere Vorstellung, wann until auf einem
     unvollständig bekannten Gegenbeispiel wahr ist. */
  UNTIL_IS_TRUE(patha,pathb) == 
    ( /* Es existiert ein Zustand k in der Zukunft, in dem Formel b wahr ist ... */
      #k.(k:STATES & k|->TRUE : pathb &
        /* ... und davor ist in jedem Zustand Formel a wahr */
        !j. (j:STATES & j<k => j|->TRUE : patha)) );
  /* Entsprechend mit falschem until */
  UNTIL_IS_FALSE(patha,pathb) ==
    ( /* Es gibt einen Zustand k, in dem beide Argumente falsch sind ... */
      #k.(k:STATES & k|->FALSE : patha & k|->FALSE : pathb &
        /* ... und in allen vorherigen Zuständen ist das Ziel falsch */
        !j. (j:STATES & j<k => j|->FALSE : pathb)) );
  /* Das folgende Prädikat soll genau dann wahr sein, wenn die vollständigen Auswertungen
     patha und pathb für until wahr liefern */
  FULL_UNTIL(patha,pathb) == ( #k. (k:STATES & pathb(k)=TRUE & patha[1..k-1]<:{TRUE}) )
SETS
  PVALUE = {PTRUE,PFALSE,PUNKNOWN}
CONSTANTS
  a, b,
  full_length
PROPERTIES
  /* Die Länge des vollständigen Pfades bleibt hart kodiert */
  full_length = 3 &
  a : STATES +-> BOOL &
  b : STATES +-> BOOL &
  /* Bei einem abgeschnittenen Pfad ist die Länge des bekannte Pfades kürzer als die Gesamtlänge,
     anders ausgedrückt: Der letzte Zustand ist nie im bekannten Pfad. */
  full_length /: dom(a) &
  full_length /: dom(b)
ASSERTIONS
  /* until ist genau dann wahr, wenn alle vollständigen Erweiterungen der teilweise bekannten
     Pfade auch war sind */
  UNTIL_IS_TRUE(a,b) <=> !(c,d).( COMPLETION(a,c) & COMPLETION(b,d) => FULL_UNTIL(c,d) );
  /* entsprechend mit falsch */
  UNTIL_IS_FALSE(a,b) <=> !(c,d).( COMPLETION(a,c) & COMPLETION(b,d) => not(FULL_UNTIL(c,d)) )
END
