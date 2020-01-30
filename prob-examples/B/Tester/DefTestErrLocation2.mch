MACHINE DefTestErrLocation2
DEFINITIONS
  myeq(xx,yy) == xx=yy;
  myneq(vv,ww) == not(myeq(vv,ww))
PROPERTIES
  myneq(1,TRUE) // currently no def context in error position
   &
  myneq(1+1,{TRUE})
END
