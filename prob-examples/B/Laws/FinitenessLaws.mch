MACHINE FinitenessLaws
DEFINITIONS SET_PREF_SYMBOLIC == TRUE
CONSTANTS
  f1,f2,f3,f4,f5,f6,f7,
  i1,i2,i3,i4,i5,i6
PROPERTIES
  /* finite sets and relations */
  f1 = {a,e|a : INTEGER & e : {TRUE} & a = 1} &
  f2 = {a,c,e|a : INTEGER & e : {TRUE} & a = 1 & c:NATURAL1 & e:{FALSE}} &
  f3 = {a,c,e|a:NATURAL & c:NATURAL1 & e:{x|x=1&x=2} & a=1}  &
  f4 = {a,c,e|a:NATURAL & c:NATURAL1 & e:INTEGER & a=-1} &
  f5 = {a,b| a>2 & a<1 & b=a} &
  f6 = %x.(x>10 & x<20|100) &
  f7 = {a,b| a:NATURAL1 & b=a & a<=20} &

  /* infinite sets and relations */
  i1 = {a,c,e|a : INTEGER & e : {TRUE} & a = 1 & c:NATURAL1} &
  i2 = {a,c,e|a : INTEGER & e : {TRUE} & a = 1 & c>4000} &
  i3 = {a,b,c|a:NATURAL1 & b<0 & c>10} &
  i4 = {a,b|a>=200 & b=a*a} &
  i5 = %x.(x>10|100+x) &
  i6 = {x,y,z|z=x+y & x>100 & y:{200,201}} 
ASSERTIONS
  f1:FIN(f1) & f2:FIN(f2) & f3: FIN(f3) & f4:FIN(f4) & f5:FIN(f5) & f6:FIN(f6) & f7:FIN(f7);
  i1 /: FIN(i1) & i2 /: FIN(i2) & i3 /: FIN(i3) & i4 /: FIN(i4) & i5 /: FIN(i5) & i6 /: FIN(i6);
  f1(1)=TRUE; 
  f2={};
  f3={};
  f4={};
  f5={};
  card(f6) = 9 & f6(11)=100;
  card(f7) = 20 & f7(20)=20;
  i1 /= {} & i2 /= {} & i3 /= {} & i4 /= {} & i5 /= {} & i6 /= {};
  (1,1024,TRUE):i1;
  (1,4001,TRUE):i2;
  (1,4000,TRUE)/:i2;
  (1,-200,1000):i3;
  (200|->40000):i4;
  i5(100) = 200;
  11:dom(i5);
  9 /: dom(i5);
  (101,201,302):i6 & (101,201,303)/:i6 & (100,201,301)/:i6 & (101,202,303)/:i6
END
