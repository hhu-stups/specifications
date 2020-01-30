
channel left,right,in,out:{0..9}

MAIN = out!1 -> left!1 -> STOP [ out <-> in ] in?x -> right!x -> STOP