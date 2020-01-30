MACHINE RestrictionTests
CONSTANTS mx
PROPERTIES mx = 10000
VARIABLES f, i
INVARIANT
 f:INTEGER +-> INTEGER & i:NATURAL
INITIALISATION f:=%x.(x:1..mx|x) || i:= 0
OPERATIONS
  Reset = BEGIN f:=%x.(x:1..mx|x) || i:= 0 END;
  r <-- Square(yy) = PRE yy = i & yy: dom(f) THEN f(i) := f(i)*f(i) || i:=yy+1 || r:= f(i)*f(i) END;
  r <-- Add(yy) = PRE yy = i & yy/: dom(f) THEN f(i) := 0 || i:=yy+1 || r:= 0 END;
  DomRestrict = BEGIN f := 1..i <| f END;
  DomSubtract = BEGIN f := 1..i <<| f END;
  RanRestrict = BEGIN f := f |> 1..i  END;
  RanSubtract = BEGIN f := f |>> 1..i  END;
  DomSubtractDifficult = BEGIN f := (f~ |>> 1..i)~  END;
  c <-- GetCard = BEGIN c := card(f) END
END


