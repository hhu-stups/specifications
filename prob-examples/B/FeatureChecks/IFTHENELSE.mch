MACHINE IFTHENELSE
SETS
 ID={aa,bb,cc}
VARIABLES xx, c
INVARIANT
 xx:ID & c:INTEGER
INITIALISATION xx,c:=aa,0
OPERATIONS
  Set(yy) = PRE yy:ID THEN
    IF xx=yy THEN
       c:= 1
    ELSIF yy=bb THEN
       xx,c := yy,2
    ELSE
       xx,c := yy,3
    END
  END;
  cres <-- GetC = cres := c
END

