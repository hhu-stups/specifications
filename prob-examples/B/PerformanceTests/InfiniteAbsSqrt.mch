MODEL InfiniteAbsSqrt

ABSTRACT_CONSTANTS
   abs,
   sqrt,
   sumpair,
   mymax
PROPERTIES
   abs = %xx.(xx : INTEGER | max ({xx, -xx})) &

   sqrt = %xx.(xx : NATURAL | max({yy | yy : INTEGER & yy * yy <= xx})) &

   sumpair = %yy.(yy: NATURAL*NATURAL | prj1(INTEGER,INTEGER)(yy)+prj2(INTEGER,INTEGER)(yy)) &

   mymax = %yy.(yy: POW(NATURAL1) | max(yy\/{0}))

DEFINITIONS 
        SET_PREF_MAXINT == 2147483647; 
        SET_PREF_MININT == -2147483647;  NNAT1 == 1..3;
        SET_PREF_MAX_OPERATIONS == 10 ;
        SET_PREF_CLPFD == TRUE /* for evaluation of sqrt closure over INTEGER ! */
OPERATIONS
    s <-- sump(x,y) = PRE x:NAT1 & y:NAT THEN s:= sumpair(x|->y) END;
    m <-- mymx_double(x) = PRE x:NAT1 THEN m:= mymax({x,2*x}) END;
    m <-- mymx(x) = PRE x:POW(NNAT1) THEN m:= mymax(x) END;

    p_rac <-- lire_sqrt (pp) =
   /*?************************************************************************
     DESCRIPTION
        Cette opÈration est implÈmentÈe de maniËre efficace : avec un calcul
        fonctionnel suivi d'un contrÙle sÈcuritaire.
     **********************************************************************?*/
      PRE
         pp : NATURAL
      THEN
         p_rac := sqrt(pp)
      END;
      
   res_abs <-- val_abs1 (aa) =
   /*?************************************************************************
     DESCRIPTION
        Cette opÈration provoque un hors code quand le paramËtre d'entrÈe vaut
        2 ** 31 - 1.
     ***********************************************************************?*/
      PRE
         aa : INTEGER
      THEN
         res_abs := max ({aa, -aa})
      END;
  
   res_abs <-- val_abs2 (aa) =
   /*?************************************************************************
     DESCRIPTION
        Cette opÈration provoque un hors code quand le paramËtre d'entrÈe vaut
        2 ** 31 - 1.
     ***********************************************************************?*/
      PRE
         aa : INTEGER
      THEN
         res_abs := abs(aa)
      END
 END