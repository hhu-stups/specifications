MACHINE PartitionIntoComponentsTest2
/* Without Partitioning this will timeout; with Paritioning the component containing
   g will be identified as the culprit */
DEFINITIONS
 CONSTR(a) == ( a: 1..10 --> BOOL &
   !i.(i:1..5 => a(i) /= a(i+1)) &
   (a(1)=TRUE or a(2)=TRUE or a(5)=TRUE) &
   (a(2)=TRUE or a(3)=TRUE or a(6)=TRUE) &
   (a(4)=FALSE or a(7)=FALSE or a(9)=TRUE) &
   (a(5)=FALSE or a(7)=FALSE or a(9)=FALSE) &
   (a(1)=FALSE or a(7)=TRUE or a(9)=FALSE) &
   (a(8)=TRUE or a(9)=FALSE) &
  /* (a(7)=TRUE => a(6)=FALSE) &
   (a(1)=TRUE or a(9)=FALSE) &
   (a(2)=TRUE or a(9)=TRUE) &
    (a(10)=FALSE or a(8)=FALSE)& */
   (a(10)=TRUE or a(9)=TRUE)
   )
CONSTANTS b,c,d,e,f,g,h,ii,j,k
PROPERTIES
 CONSTR(b) & CONSTR(c) & CONSTR(d) & CONSTR(e) & CONSTR(f) &
 CONSTR(g) & CONSTR(h) & CONSTR(ii) &  CONSTR(j) & CONSTR(k) &
 (g(10) = FALSE or g(9) = FALSE) & (g(10)=TRUE or g(9)=TRUE) &
 (g(10) = TRUE or g(9)=FALSE) & (g(10)=FALSE or g(9)=TRUE)
OPERATIONS
  r <-- Get = BEGIN r:=b END
END

