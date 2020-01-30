MACHINE CSE_Test2  /* model checking time reduced from 5.2 secs down to 4.2 secs */
VARIABLES xx,yy
INVARIANT
   xx:INTEGER & yy:INTEGER &
   (xx+yy) * (yy+xx) > xx+yy &
   (xx+yy) * (yy+xx) > 15 &
   #zz.(zz>xx & zz >= (yy+xx) & zz < (yy+xx)+1 & zz+zz > (zz+zz) - 4)
INITIALISATION xx:=2 || yy := 2
OPERATIONS
 /*  Dble = xx := xx*2; */
  Add = IF xx < 10000 THEN xx := xx+1 END
END

/*
| ?-  b_get_invariant_from_machine(M), find_common_subexpressions(M,0,true,R), tools_printing:trace_print(R,0,10), translate:print_bexpr(M),nl, translate:print_bexpr(R).
b/3(
+-greater/2(
+-+-b/3(
+-+-+-multiplication/2(
+-+-+-+-b/3(
+-+-+-+-+-add/2(
+-+-+-+-+-+-b/3(
+-+-+-+-+-+-+-identifier(xx)
+-+-+-+-+-+-+-integer
+-+-+-+-+-+-+-[
+-+-+-+-+-+-+-+-nodeid/1(
+-+-+-+-+-+-+-+-+-pos(19,1,5,5,5,6)
+-+-+-+-+-+-+-+-)
+-+-+-+-+-+-+-+-loc(local,CSE_Test2,abstract_variables)
+-+-+-+-+-+-+-)
+-+-+-+-+-+-+-]
+-+-+-+-+-+-)
+-+-+-+-+-+-b/3(
+-+-+-+-+-+-+-identifier(yy)
+-+-+-+-+-+-+-integer
+-+-+-+-+-+-+-[
+-+-+-+-+-+-+-+-nodeid/1(
+-+-+-+-+-+-+-+-+-pos(20,1,5,8,5,9)
+-+-+-+-+-+-+-+-)
+-+-+-+-+-+-+-+-loc(local,CSE_Test2,abstract_variables)
+-+-+-+-+-+-+-)
+-+-+-+-+-+-+-]
+-+-+-+-+-+-)
+-+-+-+-+-)
+-+-+-+-+-integer
+-+-+-+-+-[
+-+-+-+-+-+-sharing(0,3,top,[])
+-+-+-+-+-+-nodeid/1(
+-+-+-+-+-+-+-pos(18,1,5,5,5,9)
+-+-+-+-+-+-)
+-+-+-+-+-)
+-+-+-+-+-]
+-+-+-+-)
+-+-+-+-b/3(
+-+-+-+-+-add/2(
+-+-+-+-+-+-b/3(
+-+-+-+-+-+-+-identifier(yy)
+-+-+-+-+-+-+-integer
+-+-+-+-+-+-+-[
+-+-+-+-+-+-+-+-nodeid/1(
+-+-+-+-+-+-+-+-+-pos(22,1,5,15,5,16)
+-+-+-+-+-+-+-+-)
+-+-+-+-+-+-+-+-loc(local,CSE_Test2,abstract_variables)
+-+-+-+-+-+-+-)
+-+-+-+-+-+-+-]
+-+-+-+-+-+-)
+-+-+-+-+-+-b/3(
+-+-+-+-+-+-+-identifier(xx)
+-+-+-+-+-+-+-integer
+-+-+-+-+-+-+-[
+-+-+-+-+-+-+-+-nodeid/1(
+-+-+-+-+-+-+-+-+-pos(23,1,5,18,5,19)
+-+-+-+-+-+-+-+-)
+-+-+-+-+-+-+-+-loc(local,CSE_Test2,abstract_variables)
+-+-+-+-+-+-+-)
+-+-+-+-+-+-+-]
+-+-+-+-+-+-)
+-+-+-+-+-)
+-+-+-+-+-integer
+-+-+-+-+-[
+-+-+-+-+-+-sharing(0,3,top,[])
+-+-+-+-+-+-nodeid/1(
+-+-+-+-+-+-+-pos(21,1,5,15,5,19)
+-+-+-+-+-+-)
+-+-+-+-+-)
+-+-+-+-+-]
+-+-+-+-)
+-+-+-)
+-+-+-integer
+-+-+-[
+-+-+-+-sharing(1,1,top,[])
+-+-+-+-nodeid/1(
+-+-+-+-+-pos(17,1,5,5,5,19)
+-+-+-+-)
+-+-+-)
+-+-+-]
+-+-)
+-+-b/3(
+-+-+-add/2(
+-+-+-+-b/3(
+-+-+-+-+-identifier(xx)
+-+-+-+-+-integer
+-+-+-+-+-[
+-+-+-+-+-+-nodeid/1(
+-+-+-+-+-+-+-pos(25,1,5,24,5,25)
+-+-+-+-+-+-)
+-+-+-+-+-+-loc(local,CSE_Test2,abstract_variables)
+-+-+-+-+-)
+-+-+-+-+-]
+-+-+-+-)
+-+-+-+-b/3(
+-+-+-+-+-identifier(yy)
+-+-+-+-+-integer
+-+-+-+-+-[
+-+-+-+-+-+-nodeid/1(
+-+-+-+-+-+-+-pos(26,1,5,27,5,28)
+-+-+-+-+-+-)
+-+-+-+-+-+-loc(local,CSE_Test2,abstract_variables)
+-+-+-+-+-)
+-+-+-+-+-]
+-+-+-+-)
+-+-+-)
+-+-+-integer
+-+-+-[
+-+-+-+-sharing(0,3,top,[])
+-+-+-+-nodeid/1(
+-+-+-+-+-pos(24,1,5,24,5,28)
+-+-+-+-)
+-+-+-)
+-+-+-]
+-+-)
+-)
+-pred
+-[
+-+-sharing(2,1,top,[])
+-+-section(invariant)
+-+-nodeid/1(
+-+-+-pos(16,1,5,5,5,28)
+-+-)
+-)
+-]
)
(xx + yy) * (yy + xx) > xx + yy
(xx + yy) * (yy + xx) > xx + yy

*/