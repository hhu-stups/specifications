MACHINE HappyNumbers
DEFINITIONS
  digit(x,i) == ((x / 10**i) mod 10);
  SET_PREF_MAX_INITIALISATIONS == 1000;
  ASSERT_LTL == "(G F{cur=1}) or (G F{cur=145})"
CONSTANTS start_numbers, maxdigit
PROPERTIES
  start_numbers = 1..1000 &  maxdigit = 3
VARIABLES cur
INVARIANT cur:NATURAL
INITIALISATION cur :: start_numbers
OPERATIONS
  SquareDigits =   cur := SIGMA(d).(d:0..maxdigit|digit(cur,d)**2)
END

