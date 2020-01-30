MACHINE
    PrjTestsOK_For_AtelierB /* Atelier B compatible version */
ABSTRACT_CONSTANTS p1, empty
PROPERTIES 
     p1 : (INTEGER * INTEGER) +-> INTEGER &
     p1 = prj1({1},{2}) &
     empty <: BOOL & empty = {} /* introduce empty set so that Atelier-B type checking works */
ASSERTIONS
    prj1(NAT1,{2})((1,2)) = 1;
    prj2(NAT1,{2})((1,2)) = 2;
    prj1({1},{3})((1,3)) = 1; 
    prj1(INTEGER,INTEGER)((1,4)) = 1; 
    
    prj2(INTEGER,INTEGER)((1,4)) = 4; 
    
    prj1({2},NATURAL)((2,3)) = 2; 
    
    p1(1,2)=1;
    
    {xx,yy| xx:BOOL*BOOL & yy:BOOL*BOOL &
        prj1(BOOL,BOOL)(xx) = prj2(BOOL,BOOL)(yy) & prj2(BOOL,BOOL)(xx) = prj1(BOOL,BOOL)(yy) } =
        {((FALSE|->FALSE)|->(FALSE|->FALSE)),((FALSE|->TRUE)|->(TRUE|->FALSE)),
            
         ((TRUE|->FALSE)|->(FALSE|->TRUE)),((TRUE|->TRUE)|->(TRUE|->TRUE))};
     
    {xx,yy| xx:BOOL & yy:BOOL & prj1({xx}\/{TRUE},BOOL)(xx,FALSE) = yy} = {(FALSE|->FALSE),(TRUE|->TRUE)};
    
   prj1(BOOL,{1,2}) = (id(BOOL) >< (BOOL * {1,2}))~  /* law on page 80 of B-Book */ ;
   
   prj2(BOOL,{1,2}) = (({1,2} * BOOL) >< id({1,2}))~  /* law on page 80 of B-Book */;
   
   prj1(BOOL,empty) = (id(BOOL) >< (BOOL * empty))~  /* law on page 80 of B-Book */ ;
   
   prj2(BOOL,empty) = ((empty * BOOL) >< id(empty))~  /* law on page 80 of B-Book */;
   
   prj1(BOOL,{{1}}) = (id(BOOL) >< (BOOL * {{1}}))~  /* law on page 80 of B-Book */ ;
   
   prj2(BOOL,{1}) = (({1} * BOOL) >< id({1}))~  /* law on page 80 of B-Book */ ;
   
   prj1({empty},BOOL)(empty|->TRUE) = {}
END
