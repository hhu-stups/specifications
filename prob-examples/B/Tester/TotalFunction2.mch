MACHINE test

SETS
  CELL = {c1,c2} ; CHANNEL = {ch1,ch2}
DEFINITIONS
	disjoint(f)==!(a1,a2).( a1:dom(f) & a2:dom(f) & a1/=a2 =>  f(a1)/\f(a2)={} ) ;
	singleton(vv,SS)==
	(vv:POW1(SS) & !(xx,yy).(xx:vv & yy:vv => xx=yy))
  
VARIABLES
  f1,f2
INVARIANT
   f1 : CELL --> CHANNEL & f2 : CELL --> POW(CHANNEL)
INITIALISATION
   f1 : (f1: CELL >->> CHANNEL & f1(c1) = ch1)
   ||
   f2 : (f2: CELL --> POW(CHANNEL) & f2(c1) = {} )

OPERATIONS
 disjointop = PRE disjoint(f2) THEN skip END
END

/*

total_function(X,global_set('CELL'),
  [[fd(1,'CHANNEL'),fd(2,'CHANNEL')],[fd(1,'CHANNEL')],[fd(2,'CHANNEL')],[]]),
enumerate_basic_type(X,set(couple(global('CELL'),set(global('CHANNEL'))))).


total_function(X,global_set('Name'),
  [[fd(1,'Code'),fd(2,'Code')],[fd(1,'Code')],[fd(2,'Code')],[]]),
enumerate_basic_type(X,set(couple(global('Name'),set(global('Code'))))).


total_function(X,global_set('Name'),
  [[],[fd(1,'Code'),fd(2,'Code')],[fd(1,'Code')],[fd(2,'Code')]]),
enumerate_basic_type(X,set(couple(global('Name'),set(global('Code'))))).

*/