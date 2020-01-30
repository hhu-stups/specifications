MACHINE FactorialPi
DEFINITIONS
 SET_PREF_CLPFD == FALSE
VARIABLES xx, res
INVARIANT
 xx:NATURAL1 & res:NATURAL1
INITIALISATION xx:=1 || res := 1
OPERATIONS
  r <-- Factorial(n) = PRE n:NATURAL1 THEN
    r := PI(x).(x:1..n|x)
  END;
  FactorialX = BEGIN
    res := PI(x).(x:1..xx|x)
  END;
  Inc100 = BEGIN xx := xx+100 END;
  Inc50 = BEGIN xx := xx+50 END;
  Inc10 = BEGIN xx := xx+10 END;
  Inc1 = BEGIN xx := xx+1 END
END

