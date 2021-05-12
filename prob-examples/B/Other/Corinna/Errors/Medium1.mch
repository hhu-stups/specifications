MACHINE
   Medium1
 /* is accepted by B4free !! but not by ProB [which is correct!?] */
 VARIABLES xx, y, b

INVARIANT xx : NAT & y : INT & b : BOOL
 
INITIALISATION xx := 1|| y := -4 || 
		IF y> 0 THEN b :=TRUE ELSE b:= FALSE END

OPERATIONS
	add_sub(a) = 
	PRE a : NAT THEN
		IF y>0 THEN 
			IF y-a < 0 THEN b:= FALSE END ||
  			y:= y-a
		ELSE 
			y:= y+a ||
			IF y+a > 0 THEN b:= TRUE END 
		END
	END;

	ans <-- is_positive =
		ans := b
END