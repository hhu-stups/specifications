MACHINE           Class(maxsize)

CONSTRAINTS       maxsize : NAT1

SETS               STUDENT; RESP = {present, absent}

VARIABLES         class, num

/* num should be of type NAT  */

INVARIANT         class <: STUDENT 
                  & card(class) <= maxsize
                  & num : NAT
                  & num = card(class)

/* num must be initialised to 0. card(class) is not defined in advance
of INITIALISATION.  */

INITIALISATION    class := {} || num := 0

OPERATIONS

/* signup should only be possible if the student is not already in the
class.  Otherwise the running total num will become mismatched with
class */

  signup(ss) =
  PRE
    ss : STUDENT & ss /: class & card(class) < maxsize
  THEN
    class := class \/ {ss} || num := num + 1
  END;

/* similarly, deregister should only be possible for students in 
the class, (in which case the size of the class is positive, so num > 0 can be added to the precondition to help the autoprover.) */

  deregister(ss) =
  PRE
    ss : STUDENT & ss : class & num > 0
  THEN
    class := class - {ss} || num := num - 1
  END;

nn <-- total =
  PRE
    true
  THEN
    nn := num
  END;

rr <-- query(ss) =
  PRE
    ss : STUDENT
  THEN
    IF ss : class
    THEN rr := present
    ELSE rr := absent
    END
  END;

/* reset should set num to 0 */

  reset =
  PRE
    true
  THEN
    class := {} || num := 0
  END

END
