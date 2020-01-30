MACHINE Choice
VARIABLES
  m1, m1c,
  /*@ unit "m" */ m2,
  /*@ unit "m" */ m3,
  /*@ unit "cm" */ m4
INVARIANT
  m1 : NAT &
  m1c : NAT &
  m2 : NAT &
  m3 : NAT &
  m4 : NAT
INITIALISATION
  m1,m1c,m2,m3,m4 := 0,0,0,0,0
OPERATIONS
  choice =
    CHOICE
      m1 := m2
    OR
      m1 := m3
    END;
  choice_clash =
    CHOICE
      m1 := m3
    OR
      m1 := m4
    END
END
