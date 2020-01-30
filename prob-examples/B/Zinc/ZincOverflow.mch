MACHINE ZincOverflow
/*
From:
 http://www.g12.csse.unimelb.edu.au/minizinc/downloads/doc-1.3/minizinc-tute.pdf

var int: a; var int: b;
constraint 200*a + 150 * b <= 4000; constraint 100*a + 250 * b >= 0;
solve satisfy; output ["a = ",show(a), " b = ", show(b), "\n"];

The result of executing
$ minizinc unbounded.mzn for the default fd solver is the error message evaluation of model would result in integer overflow.
This is because the var int variables get default bounds −1,000,000..1,000,000 leading to intermediate expressions which are to big to be represented in the de- fault bounds. Changing the variable declarations to var -1000..1000 will lead to solutions being found immediately. Note that using the mixed integer solver
$ minizinc -b mip unbounded.mzn
immediately returns an answer a = 0 b = 0.

*/
CONSTANTS a,b
PROPERTIES
 200*a + 150 * b <= 4000 &
 100*a + 250 * b >= 0
OPERATIONS
  ra,rb <-- Get = BEGIN ra,rb := a,b END
END

