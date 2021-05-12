MACHINE HybridThermostat
SETS STATES = {On,Off}
VARIABLES x /*@desc "Temperature in Celcius"*/,
  state /*@desc "State of the Heater (On,Off)" */
INVARIANT
  x:REAL & x>= 18.0 & x <= 22.0 &
  state:STATES
INITIALISATION state := Off || x := 20.0
OPERATIONS
  Cool(delta,x2) = PRE delta > 0.0 & state = Off &
                       x2 >= 18.0 &
                       x2 = x - 0.1*delta /*@desc "Solve Diff. Equation " */
                  THEN
    x := x2
  END;
  Heat(delta,x2) = PRE delta > 0.0 & state = On &
                       x2 <= 22.0 &
                       x2 = x + 0.1*delta /*@desc "Solve Diff. Equation " */
                   THEN
    x := x2
  END;
  TurnHeaterOn = PRE state=Off & x < 19.0 THEN
       state := On
  END;
  TurnHeaterOff = PRE state=On & x > 21.0 THEN
       state := Off
  END
END

