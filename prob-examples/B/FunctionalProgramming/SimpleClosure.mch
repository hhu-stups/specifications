MACHINE SimpleClosure
VARIABLES x, fun
INVARIANT
 x:NAT & fun: NAT <-> NAT
INITIALISATION x:=0 || fun:= %y.(y:NAT|0)
OPERATIONS
  Inc = x := x+1;
  Set_fun_plus_x = fun := %y.(y:NAT| x+y);
  cc <-- ApplyFun(y) = PRE y:NAT THEN cc := fun(y) END
 /* This will force expansion of the closure: cc <-- add = BEGIN cc:= fun \/ {0|->0} END */
END

