MACHINE LargeRelationSetTests
DEFINITIONS
  mx == 50;
  DOM == 0..mx;
  DOM1 == 0..mx-1
VARIABLES f,g, s,t
INVARIANT
 f: INTEGER <-> INTEGER & g: INTEGER <-> INTEGER & s<:INTEGER & t<:INTEGER
INITIALISATION f := %x.(x:DOM1|(x+1) mod (mx+1)) ||
  g  := %x.(x:DOM|(x+2) mod (mx+1)) ||
  s := 2..mx-2||
  t := 4..mx-4
OPERATIONS
  res <-- ImageFS = res := f[s];
  res <-- ImageGS = res := g[s];
  ComposeFG = BEGIN f := (f;g) END;
  UnionST = BEGIN s := s \/ t END;
  res <-- DomF = BEGIN res := dom(f) END;
  res <-- RanF = BEGIN res := ran(f) END;
  res <-- DomRestrSF = BEGIN res := s<|f END;
  res <-- DomSubtrSF = BEGIN res := s<<|f END;
  res <-- RanRestrSF = BEGIN res := f|>s END;
  res <-- RanSubtrSF = BEGIN res := f|>>s END;
  InvertF = BEGIN f := f~ END;
  RightOverrideFG = f:= f<+g;
  Closure1F = f:= closure1(f);  /* now works with mx==50; after that DomRestrSF times out */
  ClosureF = f:= closure(f)  /*not yet covered */
 /* LeftOverrideFG = f:= f+>g not supported by parser*/
END

