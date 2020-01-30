MACHINE sets
SETS S
CONSTANTS
  empty, u1,u2,u3,u4,u5, i1,i2,i3,i4,i5, 
  part1,part2,part3,part4,
  extset1,extset2,ei,
  boo
PROPERTIES
 /* 1=2 &  just to avoid a long computation; but new b_ast_cleanup removes the rest of the properties now */

  empty : (S <-> INTEGER) <-> INTEGER &
  empty={} &

  u1 <: 1..10 & u2<:15..20 & u3 = u1\/u2 &
  u4 \/ u5 = u1 &

  i1 = 1..10 & i2 = 5..20 & i3 = i1/\i2 &
  i1 = i4 /\ i5 &

  /* partitition(1..100,part1,part2) */
  part1 /\ part2 = {} &
  part1 \/ part2 = 1..100 &
  card(part1)= 20 &
  /* partitition(part4,1..20,part3) */
  part3 <: 10..100 & 1..20\/part3 = part4 &
  1..20/\part3 = {} & 

  extset1 = {1,5,3} &
  extset2 = {1,5,ei} & extset2 <: 1..10 &

  boo <: BOOL*BOOL*BOOL

ASSERTIONS
  /* empty set */
  card(empty) = 0;
  /* all elements of an empty set have the information "Bottom" associated */
  !(x,y).(x|->y:empty => y:{} & !(z1,z2).(z1|->z2:x => z2:{}));
  /* information propagation via union */
  !x.(x:u3 => x:1..20);
  !x.(x:u4 => x:1..10) & !x.(x:u5 => x:1..10);
  /* information propagation via intersection */
  !x.(x:i3 => x:5..10);
  !x.(x:i4 => x/:{}) & !x.(x:i5 => x/:{}); /* We don't know anything about i4,i5 */
  /* information propagation via partition */
  card(part1) = 20 & card(part2) = 80;
  !x.(x:part1 => x:1..100) & !x.(x:part2 => x:1..100);
  card(part3) : 0..91 & card(part4) : 20..111;
  !x.(x:part3 => x:10..100) & !x.(x:part4 => x:1..100);
  /* extension sets */
  /* extset1 is now internally transformed into a B value. Its cardinality can be
     determined exactly */
  card(extset1) = 3 & card(extset2) : 1..3; 
  !x.(x:extset1 => x:1..5) & ei:1..10;
  /* cardinality is limited by the type of the set */
  card(boo) : 0..8
END
