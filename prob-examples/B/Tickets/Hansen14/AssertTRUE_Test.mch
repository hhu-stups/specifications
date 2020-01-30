MACHINE AssertTRUE_Test
DEFINITIONS
 ASSERT_TRUE(P, Msg) == 1 = 1;
 EXTERNAL_PREDICATE_ASSERT_TRUE == BOOL * STRING;
 ASSERT_EXPR(P,Msg,T) == T;
 EXTERNAL_FUNCTION_ASSERT_EXPR(T) == (BOOL * STRING * T) --> T;
Print(out, val) == val;
def == !(r).(r : k => (r'l2)(1) > 5)
CONSTANTS k,m
PROPERTIES 
k = struct(l1:{1, 3}, l2:{f | f : {1, 2} --> 1 .. 10 & (f(1) > 5 & f(2) > 5)})
& 

m = 7 &
 ASSERT_EXPR(TRUE,"check",8) > m &
(  
  (not(def) => ASSERT_TRUE(FALSE, "Test 20 Failed")) /* &
  ( def => ASSERT_TRUE(FALSE,"Test 20 succeeded"))
  m>10 => ASSERT_TRUE(FALSE, "Test 20 Failed") */
)

END