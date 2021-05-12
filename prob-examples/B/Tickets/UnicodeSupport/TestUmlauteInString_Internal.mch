
MACHINE TestUmlauteInString_Internal
CONCRETE_CONSTANTS
  a,
  b,
  c
PROPERTIES
    a : STRING
  & b : STRING
  & c : STRING
  & a = "ä"
  & b = "ae"
  & c = "a"
ASSERTIONS
     a /= b
     &
     b /= c
     &
     a /= c
INITIALISATION
    skip
END
