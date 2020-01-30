MACHINE oddeven
CONSTANTS
  m, Range
PROPERTIES
  m = 4 &
  Range = 0 .. (m - 1)
VARIABLES
  odd, even
INVARIANT
  odd : Range & even : Range 
INITIALISATION
  odd := 0 || even := 0
OPERATIONS
   res <--  get_start = res :: 1..m-1;
   test(nn) = PRE nn: Range & nn=2 THEN skip 
   END;
   update_cli(cb) = PRE cb: 1..3 /* CLI CSP Control variable */ &
                (cb=2 => even mod 2 = 0) & (cb=3 => odd mod 2 = 1) THEN skip END;


  evenput(nn) =
    PRE nn : Range & nn mod 2 = 0 THEN
      even := nn
    END;

  oddput(nn) =
    PRE nn : Range & nn mod 2 = 1 THEN
      odd := nn
    END;

  nn <-- evenget = nn := even;

  nn <-- oddget = nn := odd
END
