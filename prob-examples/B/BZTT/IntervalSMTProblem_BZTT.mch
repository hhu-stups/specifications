MACHINE IntervalSMTProblem_BZTT
/*
BZTT generates: 
domain_error(domain(.(_113,[]),_117,_118),0,set_expression,..(_117,_118))
	at se.sics.jasper.SICStus.handleQueryResult(SICStus.java:779)
	at se.sics.jasper.SPQuery.nextSolution(SPQuery.java:267)
	at animateur.engine.ServerThread.run(ServerThread.java:73)
and then hangs;
DEFINITIONS
 SET_PREF_SMT == TRUE */
VARIABLES rx,ry,rz,rv
INVARIANT
  rx: 0..1000 & ry: INTEGER & rz:INTEGER & rv:INTEGER
INITIALISATION
  rx,ry,rz,rv := 0,0,0,0 
OPERATIONS
  Solve(x,y,z,v) = PRE 
  x: 0..1000 &
 (x:1..10 or x:99..101) &
 (x:2..11 or x:100..102 or x=55) &
 (y:x..(x+2) or y:1..2) &
 (x:5..100 or y:60..120) &
 (x: 7..200 or y: 79..100) &
 (x: -2..5 or y>20) &
 (x: 101..200 or y:1..99) &
 (x: y..y or y:(x+2)..(x+5) ) &
 (x: 100..199 or y:0..199) &
 (y: (x+1)..(x+5) or x:0..100) &
 (x:1..100 or y:1..100 or z:1..10) &
 (x:102..200 or y:104..110 or z:9..99) & 
 (z:1..9 or z:11..100) &
 (z<9 => x<100) &
 (z>=9 => x>100)&
 (z>=9 => (y>100 or x<99)) &
 (v:1..99999 or x<10) &
 (v:0..99998 => (x>101 or y>103 or z>9)) &  
 (v<=99998 => (x>101 or y>103 or z>9)) &   
 (v<100 => x/0 = x) /* check well-definedness issue */
  THEN
  rx,ry,rz,rv := x,y,z,v END
END

