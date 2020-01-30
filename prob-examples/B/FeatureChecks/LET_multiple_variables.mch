MACHINE LET_multiple_variables
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  r <-- Eight_OK = LET ii,jj BE ii=2+2 & jj=ii+ii IN
     r := jj
  END;
  Toggle = BEGIN xx :: ID-{xx} END;
  r <-- Eight_KO = SELECT xx=bb THEN
          LET ii,jj BE ii=2+2 & jj=ii+ii
                     & ii<jj   /* this is not allowed; Atelier-B also complains (but during static check) */
          IN
            r := jj
     END
  END
END

