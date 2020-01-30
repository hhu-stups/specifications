MACHINE           Paperround

VARIABLES         houseset

INVARIANT         houseset:POW(NAT1) &
  card(houseset)<=2

INITIALISATION    houseset := {} 

OPERATIONS

 add(new) = 
  PRE 
    new:NAT1 & new/:houseset 
  THEN
    houseset := houseset \/ {new} 
  END;


  ans <-- number =
  BEGIN
    ans := card(houseset)
  END

END