MACHINE WD_Member_EmptySet
PROPERTIES
{} = {x| x = 1 & {(1,1)}(2) : {}}
ASSERTIONS
{} = {x| x = 1 & {(1,1)}(2) : {}};  /* not detected as WD error */
 not({(1,1)}(2) : {}) /* ;
 not({(1,1)}(2) : {1}) */
END
