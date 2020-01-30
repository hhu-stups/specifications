MACHINE HexLiterals
/* Check whether we can read in the new hexadecimal literal format */
CONSTANTS a,b,c
PROPERTIES
  a = 0xFF &
  a = 255 &
  b = 0x10 &
  c = 0xFFFF
ASSERTIONS
  b = 16;
  c = 65535
END

