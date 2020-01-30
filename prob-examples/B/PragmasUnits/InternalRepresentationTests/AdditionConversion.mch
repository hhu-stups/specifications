MACHINE AdditionConversion
DEFINITIONS
  /*@ conversion */ celsius_to_kelvin1(c) == c + 273;
  /*@ conversion */ celsius_to_kelvin2(c) == 273 + c;
  /*@ conversion */ kelvin_to_celsius(k) == k - 273
VARIABLES
  /*@ unit "degC" */ gradCelsius,
  /*@ unit "K" */ gradKelvin,
  converted11,
  converted12,
  converted2
INVARIANT
  gradCelsius:NAT &
  gradKelvin:NAT &
  converted11:NAT &
  converted12:NAT &
  converted2 :NAT
INITIALISATION gradCelsius,gradKelvin,converted11,converted12,converted2:=0,0,0,0,0
OPERATIONS
  gcToGk1  = converted11 := celsius_to_kelvin1(gradCelsius);
  gcToGk2  = converted12 := celsius_to_kelvin1(gradCelsius);
  gkToGc  = converted2 := kelvin_to_celsius(gradKelvin)
END
