MACHINE HexLiteralsLarge
/* Check whether we can read in the new hexadecimal literal format */
CONSTANTS a,b,c,d,e
PROPERTIES
  a = 0xFF &
  a = 255 &
  b = 0x10 &
  c = 0xFFFF &
  d = 0xFFFFFFFF &
  e = 0xFFFFFFFFFFFFFFFF
ASSERTIONS
  b = 16;
  c = 65535;
  d = 65536*65536 - 1;
  e = 65536**4 - 1
END

