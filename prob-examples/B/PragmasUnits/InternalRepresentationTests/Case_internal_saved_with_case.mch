
MACHINE Case_internal
CONCRETE_CONSTANTS
  /*@ inferred_unit "m" */ ic,
  /*@ unit "m" */ c_with_unit,
  /*@ unit "cm" */ c_with_another_unit
ABSTRACT_VARIABLES
  /*@ inferred_unit "error" */ xx,
  /*@ inferred_unit "m" */ yy,
  /*@ inferred_unit "error" */ zz
PROPERTIES
    c_with_unit : INTEGER
  & c_with_another_unit : INTEGER
  & ic : NAT
  & c_with_unit = 7
  & c_with_another_unit = 3
INVARIANT
    xx : NAT
  & yy : NAT
  & zz : NAT
INITIALISATION
    BEGIN
         xx := ic
      ||
         yy := 1
      ||
         zz := ic + 1
    END
OPERATIONS
  SetxxClash(param) =
    PRE
        param : NAT
    THEN
      CASE param OF
      EITHER 1 THEN
        xx := param
      OR 2 THEN
        xx := c_with_unit
      OR 3 THEN
        xx := c_with_another_unit
      ELSE
        xx := 4
      END END
    END;

  SetyyNoClash(param) =
    PRE
        param : NAT
    THEN
      CASE param OF
      EITHER 1 THEN
        yy := param
      OR 2 THEN
        yy := c_with_unit
      OR 3 THEN
        yy := 3
      ELSE
        yy := c_with_unit
      END END
    END;

  SetzzClashConstant(param) =
    PRE
        param : NAT
    THEN
      CASE param OF
      EITHER 1 THEN
        zz := param
      OR 2 THEN
        zz := c_with_another_unit
      OR 3 THEN
        zz := 3
      ELSE
        zz := c_with_another_unit
      END END
    END
END
