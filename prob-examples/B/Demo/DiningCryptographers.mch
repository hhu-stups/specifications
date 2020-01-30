MACHINE DiningCryptographers
SETS
  PHIL = {p1,p2,p3}
CONSTANTS
  coin0,coin1,coin2,
  paid0,paid1,paid2, NSApaid
PROPERTIES
  coin0:BOOL & coin1:BOOL & coin2:BOOL & 
  paid0:BOOL & paid1:BOOL & paid2:BOOL & NSApaid:BOOL &
  not(paid0=TRUE & paid1=TRUE) & not(paid0=TRUE & paid2=TRUE) & not(paid1=TRUE & paid2=TRUE) &
  (NSApaid=TRUE <=> not(paid0=TRUE or paid1=TRUE or paid2=TRUE))
DEFINITIONS
  xor2(a,b) == ((a=TRUE or b=TRUE)  & not(a=TRUE & b=TRUE));
  xor(a,b,c) == ((((a=TRUE or b=TRUE)  & not(a=TRUE & b=TRUE)) or c=TRUE)
                 & not(((a=TRUE or b=TRUE)  & not(a=TRUE & b=TRUE)) & c=TRUE))
VARIABLES
  say0,say1,say2
INVARIANT
  say0:BOOL & say1:BOOL & say2:BOOL & 
  (xor(say0,say1,say2) <=> NSApaid=FALSE)
INITIALISATION
  say0 := bool(xor(coin0,paid0,coin1)) ||
  say1 := bool(xor(coin1,paid1,coin2)) ||
  say2 := bool(xor(coin2,paid2,coin0))
OPERATIONS
  res <-- paid = BEGIN res:= bool(xor(say0,say1,say2)) END
END