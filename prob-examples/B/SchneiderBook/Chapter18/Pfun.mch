MACHINE           Pfun(INDEX, VALUE)

VARIABLES         pfun

INVARIANT         pfun : INDEX +-> VALUE

INITIALISATION    pfun := {}

OPERATIONS

  set(ii,vv) =
  PRE ii : INDEX & ii /: dom(pfun) & vv : VALUE
  THEN pfun(ii) := vv
  END;

  remove(ii) =
  PRE ii : dom(pfun) 
  THEN pfun := {ii} <<| pfun
  END;

vv <-- get(ii) =
  PRE ii : dom(pfun)
  THEN vv := pfun(ii)
  END



END

