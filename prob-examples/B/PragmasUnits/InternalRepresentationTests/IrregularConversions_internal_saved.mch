
MACHINE IrregularConversions_internal
ABSTRACT_VARIABLES
   /*@ inferred_unit "s" */ seconds_inferred,
   /*@ unit "mins" */ minutes,
   /*@ inferred_unit "mins" */ minutes_inferred,
   /*@ unit "h" */ hours,
   /*@ inferred_unit "h" */ hours_inferred,
   /*@ unit "d" */ days
INVARIANT
    seconds_inferred : NAT
  & minutes : NAT
  & minutes_inferred : NAT
  & hours : NAT
  & hours_inferred : NAT
  & days : NAT
INITIALISATION
    BEGIN
      seconds_inferred,minutes,minutes_inferred,hours,hours_inferred,days := 0,0,0,0,0,0
    END
OPERATIONS
  convert1 =
    BEGIN
      seconds_inferred := 60 * minutes
    END;

  convert2 =
    BEGIN
      minutes_inferred := 60 * hours
    END;

  convert3 =
    BEGIN
      hours_inferred := 24 * days
    END
END
