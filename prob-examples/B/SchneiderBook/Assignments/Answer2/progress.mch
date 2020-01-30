MACHINE           Progress

SETS              NAME

VARIABLES         trainee, sales,  manager

INVARIANT         trainee <: NAME
                  & sales <: NAME
                  & manager <: NAME
                  & trainee /\ sales = {}
                  & trainee /\ manager = {}
                  & sales /\ manager = {}

DEFINITIONS       employee == trainee \/ sales \/ manager

INITIALISATION    trainee, sales, manager :={},{},{}

OPERATIONS

  join(ee) =
  PRE 
    ee : NAME & ee /: employee
  THEN
    trainee := trainee \/ {ee}
  END;

  promotetrainee(ee) =
  PRE
    ee : trainee
  THEN
    trainee := trainee - {ee}
    || sales := sales \/ {ee}
  END;

  promotesales(ee) =
  PRE
    ee : sales
  THEN
    sales := sales - {ee}
    || manager := manager \/ {ee}
  END;

  fired(ee) =
  PRE
    ee : employee
  THEN
    IF ee : trainee THEN trainee := trainee - {ee}
    ELSIF ee : sales THEN sales := sales - {ee}
    ELSE manager := manager - {ee}
    END
  END
  
END
