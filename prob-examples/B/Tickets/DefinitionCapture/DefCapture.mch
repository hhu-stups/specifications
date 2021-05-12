MACHINE DefCapture
DEFINITIONS
  Double(y) == #x.(x:INTEGER & x+x=y);
  NotDouble(y) == not(Double(y))
ASSERTIONS
  Double(2);
  NotDouble(3);
  {x|x:{2,3} & NotDouble(x)} = {3}
END

