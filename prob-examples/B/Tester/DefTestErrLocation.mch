MACHINE DefTestErrLocation
SETS
 ID={aa,bb}
DEFINITIONS
  test_pred(xx) == (100/xx = 10);
  eqtrue(ee) == ee=TRUE;
  myass(yy) == eqtrue(bool(test_pred(yy)));
  funapp(zz) == {1|->TRUE,0|->FALSE}(zz);
  funapp2(zz) == {TRUE|->TRUE,FALSE|->FALSE}({1|->TRUE,0|->FALSE}(zz))
CONSTANTS iv
PROPERTIES
 iv:ID &
 //test_pred(10) &
// test_pred(0) &
 1=1
ASSERTIONS
   bool(test_pred(0)) = TRUE;
   eqtrue(bool(test_pred(0)));
   myass(0); // context myass is still missing
   eqtrue(funapp(2));
   funapp(2)=TRUE;
   eqtrue(funapp2(2));
   funapp(2/0)=TRUE;
   funapp(1)=TRUE
OPERATIONS
  Test1 = PRE eqtrue(funapp2(2)) THEN skip END
END

