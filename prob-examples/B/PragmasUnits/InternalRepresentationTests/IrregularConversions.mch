MACHINE IrregularConversions
DEFINITIONS
  /*@ conversion */ m_to_s(m) == 60 * m;
  /*@ conversion */ h_to_m(m) == 60 * m;
  /*@ conversion */ d_to_h(m) == 24 * m
VARIABLES
  seconds_inferred,
  /*@ unit "mins" */ minutes,
  minutes_inferred,
  /*@ unit "h" */ hours,
  hours_inferred,
  /*@ unit "d" */ days
INVARIANT
  seconds_inferred:NAT & minutes:NAT &
  minutes_inferred:NAT & hours:NAT &
  hours_inferred:NAT & days:NAT
INITIALISATION seconds_inferred,minutes,minutes_inferred,hours,hours_inferred,days:=0,0,0,0,0,0
OPERATIONS
  convert1 = seconds_inferred := m_to_s(minutes);
  convert2 = minutes_inferred := h_to_m(hours);
  convert3 = hours_inferred := d_to_h(days)
END
