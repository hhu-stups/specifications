MACHINE           Paperround

VARIABLES         houseset, magazine

INVARIANT         houseset:POW(NAT1) & magazine <: houseset

INITIALISATION    houseset := {} || magazine := {}

OPERATIONS

 add(new) = 
  PRE 
    new:NAT1 & new/:houseset
  THEN
    houseset := houseset \/ {new}
  END;
 add_magazine(new) = PRE new:houseset THEN
    magazine := magazine \/ {new}
  END;

  ans <-- number =
  BEGIN
    ans := card(houseset)
  END

END