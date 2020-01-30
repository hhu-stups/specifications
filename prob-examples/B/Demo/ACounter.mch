MACHINE ACounter

ABSTRACT_VARIABLES  ii,jj

INVARIANT  ii:0..10 & jj:0..10 & ii<11 & jj>=0

INITIALISATION ii,jj := 2,10

OPERATIONS
 
	inc = SELECT jj>0 THEN ii:= ii+1 || jj:=jj-1 END ;
	
	result  <-- res = result := ii
END