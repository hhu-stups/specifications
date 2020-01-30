MACHINE CONTEXT

INCLUDES
    AA.REF_APP,  BB.REF_APP
    
OPERATIONS

    rr <-- op(xx) = PRE xx:SS & xx=SS1 THEN rr:= ff END;
    rr <-- opt(xx) = PRE xx:TT THEN rr:= ff END
        
END
