MACHINE Iftest

SETS
  SS = {aa,bb,cc,dd}
  
VARIABLES
  xx
  
INVARIANT
  xx: SS
  
INITIALISATION
  xx := aa
  
OPERATIONS

  step = IF xx = aa THEN
            xx := bb
         ELSIF xx = bb THEN
            xx := cc
         ELSE
            xx := aa
         END;
         
  back = IF xx = bb THEN
              xx := aa
          ELSIF xx = cc THEN
              xx := bb
          END;

  step2 = IF xx = aa THEN
            xx := bb
         ELSIF xx = bb THEN
            xx := cc
         ELSIF xx = cc THEN
            xx := dd
         ELSE
            xx := aa
         END
              
END