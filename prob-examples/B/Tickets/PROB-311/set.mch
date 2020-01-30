MACHINE set                                                                
                                                                               
SETS                                                                           
    ELEM                                                                       
                                                                               
VARIABLES                                                                      
    ss                                                                         
                                                                               
INVARIANT                                                                      
    ss <: ELEM                                                             
                                                                               
INITIALISATION                                                                 
    ss := {}                                                                   
                                                                               
OPERATIONS                                                                     
    add(ee) =                                                                  
        PRE                                                                    
            ee : ELEM                                                      
        THEN                                                                   
            ss := ss \/ {ee}                                                   
        END;                                                                   
                                                                               
    remove(ee) =                                                               
        PRE                                                                    
            ee : ELEM                                                          
        THEN                                                                   
            ss := ss - {ee}                                                    
        END;                                                                   
                                                                               
    rr <-- in(ee) =                                                            
        PRE                                                                    
            ee : ELEM                                                          
        THEN                                                                   
            rr := bool(ee : ss)                                                
        END                                                                    
END                                                                            
                                                                               
