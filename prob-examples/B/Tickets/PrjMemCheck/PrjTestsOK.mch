MACHINE
    PrjTestsOK
CONSTANTS p1
PROPERTIES p1 = prj1({1},{2})
ASSERTIONS
    prj1(NAT1,{2})((1,2)) = 1;
    prj2(NAT1,{2})((1,2)) = 2;
    prj1({1},{3})((1,3)) = 1; 
    prj1(INTEGER,INTEGER)((1,4)) = 1; 
    prj2(INTEGER,INTEGER)((1,4)) = 4; 
    prj1({2},NATURAL)((2,3)) = 2; 
    p1(1,2)=1;
    {x,y| prj1(BOOL,BOOL)(x) = prj2(BOOL,BOOL)(y) & prj2(BOOL,BOOL)(x) = prj1(BOOL,BOOL)(y) } =
        {((FALSE|->FALSE)|->(FALSE|->FALSE)),((FALSE|->TRUE)|->(TRUE|->FALSE)),
         ((TRUE|->FALSE)|->(FALSE|->TRUE)),((TRUE|->TRUE)|->(TRUE|->TRUE))};
    {x,y| prj1({x}\/{TRUE},BOOL)(x,FALSE) = y} = {(FALSE|->FALSE),(TRUE|->TRUE)};
   prj1(BOOL,{1,2}) = (id(BOOL) >< (BOOL * {1,2}))~  /* law on page 80 of B-Book */ ;
   prj2(BOOL,{1,2}) = (({1,2} * BOOL) >< id({1,2}))~  /* law on page 80 of B-Book */;
   prj1(BOOL,{}) = (id(BOOL) >< (BOOL * {}))~  /* law on page 80 of B-Book */ ;
   prj2(BOOL,{}) = (({} * BOOL) >< id({}))~  /* law on page 80 of B-Book */;
   prj1(BOOL,{{1}}) = (id(BOOL) >< (BOOL * {{1}}))~  /* law on page 80 of B-Book */ ;
   prj2(BOOL,{1}) = (({1} * BOOL) >< id({1}))~  /* law on page 80 of B-Book */ ;
   prj1({{}},BOOL)({}|->TRUE) = {}
END
