MACHINE Timeout
ABSTRACT_CONSTANTS
  A_SubnetPrefixToIPV4
PROPERTIES
  A_SubnetPrefixToIPV4 : INTEGER <-> (INTEGER<->INTEGER)
& A_SubnetPrefixToIPV4 = %x.(x : INTEGER & x : 1..32 | ((1..x) * {1}) ^ ((1..(32-x)) * {0}) )

ASSERTIONS
  A_SubnetPrefixToIPV4(24) = [1,1,1,1, 1,1,1,1,  1,1,1,1, 1,1,1,1,  1,1,1,1, 1,1,1,1, 0,0,0,0, 0,0,0,0]
END