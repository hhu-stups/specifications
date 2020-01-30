MACHINE Bakery1
ABSTRACT_VARIABLES  p1, p2, y1, y2

INVARIANT  
	p1:0..2 & p2:0..2 & y1:NATURAL & y2:NATURAL &
	(p1=2 => p2<2) & (p2=2 => p1<2) &
	(y1 < 8)

INITIALISATION  p1,p2,y1,y2 := 0,0,0,0

OPERATIONS
	try1   = SELECT p1=0 THEN p1:=1 || y1:=y2+1 END ;
	enter1 = SELECT p1=1 & (y2=0 or y1<y2) THEN p1:=2 END ;
	leave1 = SELECT p1=2 THEN p1:=0 || y1:=0 END ;

	try2   = SELECT p2=0 THEN p2:=1 || y2:=y1+1 END ;
	enter2 = SELECT p2=1 & (y1=0 or y2<y1) THEN p2 := 2 END ;
	leave2 = SELECT p2=2 THEN p2:=0 || y2:=0 END 

END

