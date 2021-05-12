MACHINE TestSequenceWD
CONSTANTS a,b
PROPERTIES
  a = [2,3,4,5] &
  b = [6,7,8]
ASSERTIONS
  first(a) = 2;
  size(tail(a)) = 3;
  first(tail(a)) = 3;
  first(front(front(b))) = 6;
  first(front(front(front(b)))) = -1; // wd
  size(1..3 <| a) = 3;
  size(dom(b) <| a) = 3;
  size(a \/ b) > 0 //wd
END
