MACHINE TestIFTWD
CONSTANTS
  x,y,z, m
PROPERTIES
  x:NATURAL &
  y = {TRUE|->10/x,FALSE|->0}(bool(x>0)) &
  z = IF x>0 THEN 10/x ELSE 0 END & y> x &
  m = max(x..y)
END
