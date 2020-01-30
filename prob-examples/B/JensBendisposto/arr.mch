MACHINE arr(n,TYP)
CONSTRAINTS n:NATURAL1
VARIABLES array
INVARIANT array: NATURAL1+->TYP & card(dom(array))<=n
INITIALISATION array:={}
OPERATIONS
write(index,value)= PRE index:NATURAL1 & card(dom(array) \/ {index})<=n
& value:TYP THEN array:=array<+{index|->value} END;
v<--read(index) = PRE index:dom(array) THEN v:=array(index) END;
swap(i,j) = PRE i<j & i:dom(array) & j:dom(array) THEN array := array <+ { i|->array(j), j|->array(i) } END
END