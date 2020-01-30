MACHINE TestM
SETS
  STATE={s01,s02,s03,s04,s05,s06,s07,s08,s09,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,End,Start}
VARIABLES
  state
INVARIANT
  state : STATE
INITIALISATION
    BEGIN
      state := Start
    END
OPERATIONS
  Start = 
    SELECT 
      state = Start
    THEN 
      state :: {s01,s02,s03,s04}
    END;
  
  s01 = 
    SELECT 
      state = s01
    THEN 
      state := s02
    END;
  
  s04 = 
    SELECT 
      state = s04
    THEN 
      state := s05
    END;
  
  s02 = 
    SELECT 
      state = s02
    THEN 
      state :: {s06,s07}
    END;
  
  s06 = 
    SELECT 
      state = s06
    THEN 
      state :: {s03,s08,s07}
    END;
  
  s08 = 
    SELECT 
      state = s08
    THEN 
      state := s09
    END;
  
  s10 = 
    SELECT 
      state = s10
    THEN 
      state := s11
    END;
  
  s05 = 
    SELECT 
      state = s05
    THEN 
      state :: {s10,End}
    END;
  
  s03 = 
    SELECT 
      state = s03
    THEN 
      state := s12
    END;
  
  s09 = 
    SELECT 
      state = s09
    THEN 
      state := s13
    END;
  
  s13 = 
    SELECT 
      state = s13
    THEN 
      state := End
    END;
  
  s12 = 
    SELECT 
      state = s12
    THEN 
      state := s14
    END;
  
  s07 = 
    SELECT 
      state = s07
    THEN 
      state :: {s15,s16,s17}
    END;
  
  s18 = 
    SELECT 
      state = s18
    THEN 
      state :: {s07,End}
    END;
  
  s11 = 
    SELECT 
      state = s11
    THEN 
      state := s14
    END;
  
  s14 = 
    SELECT 
      state = s14
    THEN 
      state :: {s19,End,s18}
    END;
  
  s19 = 
    SELECT 
      state = s19
    THEN 
      state := End
    END;
  
  s15 = 
    SELECT 
      state = s15
    THEN 
      state := s20
    END;
  
  s17 = 
    SELECT 
      state = s17
    THEN 
      state :: {s21,s22}
    END;
  
  s16 = 
    SELECT 
      state = s16
    THEN 
      state :: {s21,s22}
    END;
  
  s21 = 
    SELECT 
      state = s21
    THEN 
      state := s20
    END;
  
  s22 = 
    SELECT 
      state = s22
    THEN 
      state := s23
    END;
  
  s23 = 
    SELECT 
      state = s23
    THEN 
      state := s20
    END;
  
  s20 = 
    SELECT 
      state = s20
    THEN 
      state :: {End,s24}
    END;
  
  s24 = 
    SELECT 
      state = s24
    THEN 
      state := End
    END
END
