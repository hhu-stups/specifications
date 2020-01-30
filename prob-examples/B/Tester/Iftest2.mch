MACHINE Iftest

SETS
  SS = {aa,bb,cc,dd}
  
VARIABLES
  xx, yy
  
INVARIANT
  xx: SS & yy:SS
  
INITIALISATION
  xx := aa || yy := bb
  
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
  back2 = IF xx = bb THEN
              xx := aa
          ELSIF xx = cc THEN
              xx := bb
         ELSE
             skip
          END;
  back3 = IF xx = bb THEN
              xx := aa
          ELSIF xx = cc THEN
              xx := bb
         ELSE
             yy := aa
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