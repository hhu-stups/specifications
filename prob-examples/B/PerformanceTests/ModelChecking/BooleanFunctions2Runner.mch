MACHINE BooleanFunctions2Runner
// a good example for using TLC backend
DEFINITIONS
  ANIMATION_FUNCTION == {1}*[in_a,in_b,in_c, 10, out_1,out_2];
  ANIMATION_FUNCTION1 == {0}*[11,12,13,10,1,2];
 // ANIMATION_FUNCTION2 == {0}*["in_a","in_b","in_c", " ", "out_1","out_2"];
      ANIMATION_IMG0 == "images/sm_0.gif";
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG10 == "images/sm_empty_box.gif";
      ANIMATION_IMG11 == "images/sm_A.gif";
      ANIMATION_IMG12 == "images/sm_B.gif";
      ANIMATION_IMG13 == "images/sm_C.gif";
INCLUDES BooleanFunctions2
VARIABLES in_a,in_b,in_c, out_1, out_2
INVARIANT
  {in_a,in_b,in_c, out_1, out_2} <: 0..1
INITIALISATION in_a,in_b,in_c, out_1, out_2 := 0,0,0, 0,0
OPERATIONS
 //  Shift = bv := %x.(x:2..n|bv(x-1)) \/ {1|->1};
 //   Rotate = bv := %x.(x:2..n|bv(x-1)) \/ {1|->bv(n)};
   LCHIP_FUNCTION_SIM(a,b,c) = BEGIN
     out_1,out_2 <-- LCHIP_FUNCTION(a,b,c) ||
     in_a,in_b,in_c := a,b,c
   END
END

