MACHINE WrongConversionAddition
DEFINITIONS
  /*@ conversion */ wrong_conversion(in) == in + 275
VARIABLES
  /*@ unit "degC" */ gradCelsius,
  gradKelvin
INVARIANT
  gradCelsius : NAT &
  gradKelvin : NAT
INITIALISATION gradCelsius,gradKelvin:=0,0
OPERATIONS
  gcToGk1  = gradKelvin:=wrong_conversion(gradCelsius)
END
