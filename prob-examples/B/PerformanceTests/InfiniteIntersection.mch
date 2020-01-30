MACHINE InfiniteIntersection
/* check that we can take intersection with infinite sets */
ABSTRACT_CONSTANTS even,odd
PROPERTIES
 even = {x|x>0 & x mod 2 = 0} &
 odd  = {z|z>0 & z mod 2 = 1}
ASSERTIONS
  even /\ {1024,1026,1027} = {1024,1026};
  ( even /\ {1,2,3,1024,1026,1027} ) /\ odd = {};
  odd /\ {1024,1026,1027} = {1027};
  {x|even /\ {x}={} & x:1025..1028} = {1025,1027}
END

