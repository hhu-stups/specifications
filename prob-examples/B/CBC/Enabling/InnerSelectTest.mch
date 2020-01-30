MACHINE InnerSelectTest
VARIABLES x
INVARIANT
 x:1..10
INITIALISATION x:= 1
OPERATIONS
  Set = SELECT x < 10 THEN skip ; SELECT x = 0 THEN skip WHEN x = 2 THEN skip END END;
  Case = CASE x OF 
           EITHER 1 THEN x := 2
           OR 2 THEN x := 3
           OR 3 THEN x:= 4
           ELSE SELECT x<5 THEN x:= 1 END 
        END END
END
