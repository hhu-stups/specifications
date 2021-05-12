MACHINE AssignmentListNotSameLength
VARIABLES pc1,pc2,pc3
INVARIANT
 {pc1,pc2,pc3} <: 0..1
INITIALISATION
  pc1,pc2,pc3 := 0,0 // missing value on RHS
OPERATIONS
  Step1 = SELECT pc1=0 THEN pc1:=1 END;
  Step2 = SELECT pc2=0 THEN pc2:=1 END;
  Finish = SELECT pc1=1 & pc2=1 & pc3=0 THEN pc3:=0 END 
END

