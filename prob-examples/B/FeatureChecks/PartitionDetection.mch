MACHINE PartitionDetection
/* check that partitions are also detected inside various substitutions */
VARIABLES n
INVARIANT
 n:NATURAL
INITIALISATION n:=1000
OPERATIONS
  HalvePRE(xx,yy) = PRE xx \/ yy = 1..n & xx /\ yy = {} & yy = 1..(n/2) THEN n:= card(yy) END;
  HalveSELECT(xx,yy) = SELECT n<1 THEN skip
         WHEN xx \/ yy = 1..n & xx /\ yy = {} & yy = 1..(n/2) THEN n:= card(yy) END;
  HalveSELECTELSE(xx,yy) = SELECT n<1 THEN skip
         WHEN xx \/ yy = 1..n & xx /\ yy = {} & yy = 1..(n/2) THEN n:= card(yy) 
         ELSE skip
     END;
  HalveIF(xx,yy) = SELECT xx<:1..n & yy<:1..n THEN 
         IF xx \/ yy = 1..n & xx /\ yy = {} & yy = 1..(n/2) THEN n:= card(yy) 
         ELSE skip
         END
     END;
  Double = BEGIN n := n*2 END
END

