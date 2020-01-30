/*

    ATB constraints:
    - formal param names shall not contain numbers, lowercase
    - names shall have length of AT LEAST 2
*/

MACHINE X1(T_, init)

CONSTRAINTS
    init : T_
    
EXTENDS y1.Y1(T_, init)

VARIABLES
    v1
    
INVARIANT
    v1 : INT

INITIALISATION
    v1:=0

OPERATIONS

    opx1 = BEGIN skip END

END
