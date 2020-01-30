MACHINE WrongConversionMultiplication
DEFINITIONS
  /*@ conversion */ wrong_conversion(in) == 24*in
VARIABLES
  /*@ unit "m" */ meter1,
  meter2
INVARIANT
  meter1 : NAT &
  meter2 : NAT
INITIALISATION meter1,meter2:=0,0
OPERATIONS
  wrong  = meter2:=wrong_conversion(meter1)
END
