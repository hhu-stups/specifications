MACHINE SaveSpec
 SETS ALLFILENAME={a,b,c,cc,dd,ee};CONTENT={nix,bla,fasel,laber}
CONSTANTS
  empty,FILENAME
PROPERTIES empty:CONTENT  &  FILENAME <: ALLFILENAME &
   
   /* fuer model check: */ empty = nix & FILENAME = {a,b,c} 
	

	VARIABLES disk, ram, opened 
 INVARIANT disk:ALLFILENAME +-> CONTENT & ram: FILENAME +-> CONTENT & opened <: FILENAME 
 INITIALISATION disk,opened,ram:={},{},{}
 OPERATIONS
  create_new(filename)= PRE filename:FILENAME & filename /: dom(disk) THEN disk:= disk \/ {filename|->empty} END;
  open_file(filename)= PRE filename:FILENAME & filename:dom(disk) & filename/:opened 
  							THEN ram:= ram <+ {filename|->disk(filename)}  ||
  							     opened := opened \/ {filename}
  						END;
  recover(filename)= PRE filename:FILENAME & filename:dom(ram) & filename/:opened
  							THEN  opened := opened \/ {filename}
  						  	  
  						END;
  close_file(filename)= PRE filename:FILENAME  & filename:opened  
                        THEN 
                         ram:=ram - {filename|->ram(filename)} || opened := opened - {filename}
                        END;  
  edit_file(filename, content) = PRE filename:FILENAME & filename:opened & content:CONTENT & content/=ram(filename)
  								 THEN  ram(filename):=content 
  								 END;
  save_file(filename)= PRE filename:FILENAME & filename:opened & disk(filename)/=ram(filename) 
  					   THEN disk(filename):=ram(filename)
  					   END;
  crash = opened:={};		
  r <-- getContent(filename)= PRE filename:FILENAME & filename:dom(disk) THEN r:=disk(filename) END;
  r <-- isDirty(filename)= PRE filename:FILENAME & filename:opened THEN 
                            IF disk(filename)/=ram(filename) THEN r := TRUE ELSE r := FALSE END
                           END
                     
END 