MACHINE           FullStats

SEES              Bool_TYPE

CONSTANTS         maxmark

PROPERTIES        maxmark : NAT1

VARIABLES         marks        

INVARIANT         marks : 0..maxmark --> NAT

/* The initialisation sets all entries in the array to 0 */

INITIALISATION    marks := (0..maxmark) * {0}

OPERATIONS

enter(new) =
  PRE
    new : 0..maxmark
  THEN
    marks(new) := marks(new) + 1
  END;

av <-- average =
  PRE
    not(ran(marks) <: {0})
  THEN
    av := (SIGMA(zz).(zz : dom(marks) | zz*marks(zz))) 
          / (SIGMA(zz).(zz:dom(marks) | marks(zz))) 
  END;

num <-- query(mm) =
  PRE
    mm : 0..maxmark
  THEN
    num := marks(mm)
  END;

/* query_over gives as output the total number of people that have scored at
least the mark mm provided as input.  */

num <-- query_over(mm) =
  PRE 
    mm : 0..maxmark
  THEN
    num := (SIGMA(zz).(zz : mm..maxmark & zz : dom(marks) | marks(zz))) 
  END;

/* query_number(nn) asks whether there is any mark that has had exactly nn
people score it.  In other words, whether nn is an entry in the marks array */

rep <-- query_number(nn) =
  PRE
    nn : NAT
  THEN
    IF nn : ran(marks)
    THEN rep := TRUE
    ELSE rep := FALSE
    END
  END

END
