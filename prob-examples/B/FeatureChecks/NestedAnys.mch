MACHINE NestedAnys
/* Tests for proper working of LET extraction from ANY substitution */
SETS
 ID={aa,bb}
VARIABLES x,y,z
INVARIANT
 x:INTEGER & y:INTEGER & z:INTEGER
INITIALISATION x,y,z := 0,0,0
OPERATIONS
  Op1 = ANY xx,yy WHERE xx=x & yy=y & xx=yy & xx=0 THEN
    x := xx+1 || y := xx+2
  END;
  
  Op2 = ANY xx,yy WHERE xx=x & yy=y & xx/=yy THEN
          ANY zz WHERE zz<1 & zz=z THEN
             z := zz+1
          END
  END;
  Op3 = ANY xx,yy WHERE xx=x & yy=y & xx/=yy & x>0 THEN
          ANY zz,vv WHERE zz>0 & zz=z & zz<3 & vv:{10,11} THEN
             z := vv+zz
          END
  END;
  Op4 = ANY xx,yy WHERE z>=10 & xx=x & yy=y THEN
          x := xx || y := yy
  END
END

