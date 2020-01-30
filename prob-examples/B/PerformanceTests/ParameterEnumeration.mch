MACHINE ParameterEnumeration // check performance for parameters that do not have to be enumerated
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:INTEGER
INITIALISATION xx:=0
OPERATIONS
  Inc(a,b,c,d) = PRE a=xx & b = {a,a-1} & c = xx+xx & d = c+c & a < 100000 THEN
    xx := xx+1
  END
END

