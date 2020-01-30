MACHINE toro2
/* unsatisfiable */
CONSTANTS x0,x1,x2
PROPERTIES
#(v_0,v_1,v_2).
(  v_0 = (x0 - x2) & 
   v_1 = (x1 - x2) &
   v_2 = (x0 - x1) &
   v_0 <= 1 & 
   v_0 >= 0 &
   v_1 <= 1 &
   v_1 >= 0 & 
   not(x0 = x1) & 
   not(v_2 = 1) & 
   not(v_2 = -1)
)
END

/*
For REPL: 
v_0 = (x0 - x2) & v_1 = (x1 - x2) & v_2 = (x0 - x1) & v_0 <= 1 & v_0 >= 0 & v_1 <= 1 & v_1 >= 0 & not(x0 = x1) & not(v_2 = 1) & not(v_2 = -1) 
    
    */