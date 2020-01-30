MACHINE ForallConstraints
 /*   A simple test to check whether the !x .(x:S => P) optimiziation of ProB works correctly */
SETS
 ID={aa,bb,cc,dd}
CONSTANTS array
PROPERTIES
 array: 1..100 --> ID &
 !x.(x:dom(array) => ( (x mod 2 = 0 => array(x) = dd) &
                       (x mod 2 /= 0 => array(x) = bb) ) )
OPERATIONS
  r <-- GetArray(i) = PRE i: dom(array) THEN r := array(i) END
END

