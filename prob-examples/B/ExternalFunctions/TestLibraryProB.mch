MACHINE TestLibraryProB
SETS Enum = {E1,E2,E3}
DEFINITIONS "LibraryProB.def"
CONSTANTS x
PROPERTIES x:{0,1}
ASSERTIONS
   ASSERT_EXPR(bool(x>0),"arg not positive",10/x) = 10;
   TO_INT(E1) = 1;
   TO_INT(E3) = 3
END

