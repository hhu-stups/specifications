MACHINE ComponentPartitioningTest
/* Test if ProB properly partitions the constraint below into individual components */
SETS
 ID
CONSTANTS f1,n1,  f2,n2,  f3,n3,  f4,n4
PROPERTIES
  card(ID) = 5 &

  n1 = 5 &
  f1 : 1..n1 +-> ID &
  card(dom(f1)) = n1-1 & 2 /: dom(f1) &

  
  n2 = 5 &
  f2 : 1..n2 +-> ID &
  card(dom(f2)) = n2-1 & 2 /: dom(f2) &


  n3 = 5 &
  f3 : 1..n3 +-> ID &
  card(dom(f3)) = n3-1 & 2 /: dom(f3) &


  n4 = 5 &
  f4 : 1..n4 +-> ID &
  card(dom(f4)) = n4-1 & 2 /: dom(f4) 
  
END

