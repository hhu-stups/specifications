MACHINE PexSolve
DEFINITIONS SET_PREF_MAXINT == 100; SET_PREF_CLPFD == TRUE
CONSTANTS x1, x,y
PROPERTIES
 
/* http://pexforfun.com:80/default.aspx?language=CSharp&sample=Result   
  // What value of x solves this equation? Ask Pex to find out!
    if (x * 3 + 27 == 153)
    ...
*/
 x1 * 3 + 27 = 153

/*
 http://pexforfun.com:80/default.aspx?language=CSharp&sample=NonLinearArithmetic
    // What values of x and y solve this equation? Ask Pex to find out!
    if (x >= 0 && x <= 100 &&
        y >= 0 && y <= 100 &&
        x * y - 37 * y + 71 * x - 2627 == 0)        
      Console.WriteLine("equation solved"); 
*/
&

x >= 0 & x <= 100 &
        y >= 0 & y <= 100 &
        x * y - 37 * y + 71 * x - 2627 = 0
OPERATIONS
 r <-- Result = BEGIN r := (x,y,x1) END
END

