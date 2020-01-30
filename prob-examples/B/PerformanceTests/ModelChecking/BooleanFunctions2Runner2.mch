MACHINE BooleanFunctions2Runner2
PROPERTIES n=3
DEFINITIONS
  firstr == IF ptr > 10 THEN ptr-10 ELSE 1 END;
  ANIMATION_FUNCTION == %r.(r:firstr..(ptr-1) | [in_a(r),in_b(r),in_c(r), 10, out_1(r),out_2(r)]);
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
VARIABLES in_a,in_b,in_c, out_1, out_2, ptr
INVARIANT
  {in_a,in_b,in_c, out_1, out_2} <: seq(0..1) &
  ptr:NATURAL
INITIALISATION in_a,in_b,in_c, out_1, out_2 := [],[],[], [],[] ||
  ptr := 1
OPERATIONS
 //  Shift = bv := %x.(x:2..n|bv(x-1)) \/ {1|->1};
 //   Rotate = bv := %x.(x:2..n|bv(x-1)) \/ {1|->bv(n)};
   LCHIP_FUNCTION_SIM(a,b,c) = BEGIN
     VAR o1,o2 IN
       o1,o2 <-- LCHIP_FUNCTION(a,b,c) ;
       out_1(ptr),out_2(ptr) := o1,o2
     END
     ||
     in_a(ptr),in_b(ptr),in_c(ptr) := a,b,c ||
     ptr := ptr+1
   END
END

