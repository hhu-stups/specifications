MACHINE TestExistsLetExtraction
CONSTANTS z
PROPERTIES
 #(A,a,b).(A : INTEGER & 
  ((((A = a * b & a = 3 * b) &
    (a - 5) * (b + 5) = A + 35) & a : 0 .. 100) & b : 0 .. 100)) &
 #(x,y).(x=1+z & y=x+2 & y=2*z)

& z:-1000..1000
OPERATIONS
 r <-- GetZ = r:=z 
END

