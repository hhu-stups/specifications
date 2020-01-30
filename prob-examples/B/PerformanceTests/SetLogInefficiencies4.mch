MACHINE SetLogInefficiencies4
/* for version 4.6.14 */
ASSERTIONS
 (1..20) - {10} = 1..9 \/ 11..20;
/*
?- [setlog].
?- setlog.
{log}=> diff(int(1,4.,{3},R)

R = {1, 2, 4}

Takes more than 10 seconds: (solved 4.6.17)

{log}=> diff(int(1,14.,{6},R)

R = {1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14}

Another solution?  (y/n)y

no

*/
(1..30) - (11..14) = 1..10 \/ 15..30;
/* takes several seconds also in setlog 4.6.17:
{log}=> diff(int(1,30),int(1.,14),R)

R = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30}
*/

(1..40) - (20..30) = 1..19 \/ 31..40;
/* takes very long in setlog 4.6.17
{log}=> diff(int(1,40),int(2.,30),R)



*/


(1..10) /\ {0} = {};
/*
{log} => inters(int(1,10),{0},R).

R = {}

Another solution?  (y/n)y
<--- takes several seconds here (solved in 4.6.17)
*/

{1,2,3,4} /\ {2,1,4} = {1,2,4};
/*
{log}=> inters({1,2,3,4},{2.1,4},R)

R = {1, 2, 4}

Another solution?  (y/n)y

R = {1, 2, 4}

Another solution?  (y/n)y

R = {1, 2, 4}

...
*. */

1..10 \/ 2..15 = 1..15;
/* takes ver long (> 5 minutes at least) in setlog; also in 4.6.17
un(int(1,10),int(2,15),R).

un(int(1,9),int(2,12),R) > 10 seconds
*/



 #(X,Y,Z,V,W,A,B,C).({X,Y,Z,V,W,A,B,C} = {1,2,3,4,5,6,7,8} & X>Y & Y>Z & Z>V & V>W & W>A & A>B & B>C)
&
 not(#(X,Y,Z,V,W,A,B,C).({X,Y,Z,V,W,A,B,C} = {1,2,3,4,5,6,7} & X>Y & Y>Z & Z>V & V>W & W>A & A>B & B>C))
&
/* Both queries above can be typed in as is into setlog and take very long */



/* BUGS IN SETLOG ?? */

{X|{X} \/ 1..15 = 1..15 & {X} \/ 15..20 = 15..20} = {15};
/* {log}=> un({X},int(1,15),int(1,15)),   un({X},int(15,20),int(15,20)).

no

--> we have to use & instead of ,
*/

{X| X /\ {1} = {} & X \/ {1} = 1..20} = {2..20};
/*
inters(X,{1},{}), un(X,{1},int(1,20)).
no 


inters(X,{1},{}) & un(X,{1},int(1,20)).
X = int(2, 20)

Another solution?  (y/n)y


*/

/* Other inefficiencies:

s <:1..20 & SIGMA(x).(x:s|x)=100
30 ms
wiht setlog: subset(S,int(1,20)) & sum(S,100).
several seconds

s <:1..20 & SIGMA(x).(x:s|x)=199
30 ms
with setlog: minutes ?


*/

/*
this works quite well in setlog
{1,2,3,4,5,6,7,8,9} \/ X = {1,2,3,4,5,6,7,8,9,22,33,0,1024,2048} & X /\ {1,2,3,4,5,6,7,8,9} ={}

un({1,2,3,4,5,6,7,8,9},X,{1,2,3,4,5,6,7,8,9,22,33,0,1024,2048}) & inters(X,{1,2,3,4,5,6,7,8,9},{}).

{log}=> un({1,2,3,4,5,6,7,8,9},X,{1,2,3,4,5,6,7,8,9,22,33,0,102 & inters(X,{1,2,3,4,5,6,7,8,9},{}).

X = {22, 33, 0, 1024, 2048}

Another solution?  (y/n)y

*/
1=1
END