MACHINE ValmariStubbornSets
/* An attempt at formalising the paper 
   Stubborn Sets for Reduced State Space Generation
   by Antti Valmari, 1989
*/
SETS
 V = {x,y,z}; /* variables */
 T = {incx,incy,sum,eq} /* transitions */
DEFINITIONS
  SET_PREF_MAXINT == 3;
  STATES == (V-->NAT);
  en(s,t) == (s|->t) : dom(next)
ABSTRACT_CONSTANTS next
CONSTANTS ss0, test, read, write,  testv, readv, writev
PROPERTIES
 /* a concrete system to be model checked for ProB animation purposes: */
 ss0 = {x|->0,y|->0,z|->0} &
 test = { incx |-> {x}, incy |-> {y}, eq |-> {x,y}, sum |-> {} } &
 read = { incx |-> {x}, incy |-> {y}, eq |-> {x,y}, sum |-> {x,y} } &
 write = { incx |-> {x}, incy |-> {y}, eq |-> {}, sum |-> {z} } &
 next = %(s,t).(s:STATES & t=incx & s(x)<MAXINT | s <+ {x|->s(x)+1}) \/
        %(s,t).(s:STATES & t=incy & s(y)<MAXINT | s <+ {y|->s(y)+1}) \/
        %(s,t).(s:STATES & t=eq & s(x)=s(y) | s)  \/
        %(s,t).(s:STATES & t=sum | s <+ {z|->(s(x)+s(y)) mod MAXINT}) &

 next : STATES * T +-> STATES &

 /* Definition 1.6 */
 test : T --> POW(V) &
 read : T --> POW(V) &
 write : T --> POW(V) &

 /* Definition 1.7 */
 testv : V --> POW(T) &
 !v.(v:V => testv(v) = {t|t:T & v:test(t)}) & 
 readv : V --> POW(T) &
 !v.(v:V => readv(v) = {t|t:T & v:read(t)}) &
 writev : V --> POW(T) &
 !v.(v:V => writev(v) = {t|t:T & v:write(t)}) 

VARIABLES s
INVARIANT
 s:STATES
INITIALISATION s:=ss0
OPERATIONS
  Step(t) = PRE t:T & en(s,t) THEN s:= next(s,t) END
END

