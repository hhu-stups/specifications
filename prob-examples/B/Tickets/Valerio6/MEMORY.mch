/* MEMORY
* Author: valerio
* Creation date: sex out 31 2008
*/
MACHINE
    MEMORY
    
SEES
    ALU,
    BIT_DEFINITION ,
    MAX_BIT_VECTOR_DEFINITION,
    BYTE_DEFINITION,
    BV16_DEFINITION,
    
    UCHAR_DEFINITION,
    SCHAR_DEFINITION,
    SSHORT_DEFINITION,
    USHORT_DEFINITION,
    POWER2 
    
DEFINITIONS
    
    
    
    SET_PREF_SYMBOLIC == TRUE;    
    
    
CONSTANTS
    PROGRAM_R_ADR ,
    DATA_R_ADR ,
    STACK_R_ADR 
    
PROPERTIES
    
    /* Real mode */
    PROGRAM_R_ADR = USHORT &
    DATA_R_ADR = USHORT &
    STACK_R_ADR = USHORT 
    
    /* More security mode 
    PROGRAM_R_ADR = 0..16384 &
    DATA_R_ADR = 16385..49151 &
    STACK_R_ADR = 49152..65535 */
    
    
ABSTRACT_VARIABLES
    
    mem
    
INVARIANT
    /*Simplification ProB*/
    mem : BV16 +-> BYTE 
    
    
ASSERTIONS
    
    ran(mem) <: BYTE &
    dom(mem) = BV16 &
    !(address,value).( address : BV16 & value : BYTE =>    mem <+ { address |-> value } : BV16 --> BYTE ) 
    
    /*  More security mode & PROGRAM_R_ADR /\ DATA_R_ADR /\ STACK_R_ADR = {}  */
    
    
INITIALISATION
    mem := {[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]|->[0,0,0,0,0,0,0,0]}
    
OPERATIONS
    
    updateMem(NewValues) =
    PRE NewValues : BV16 +-> BYTE  /*& !(elem).( elem : dom(NewValues) => bv16_ushort(elem) : PROGRAM_R_ADR)*/
    THEN
        mem:= mem <+ NewValues 
    END;
    
    updateAddressMem(address, value) =
    PRE   address : BV16 & value : BYTE     THEN
        mem:= mem <+ { address |-> value }
    END;
    
    updateStack(NewValues) =
    PRE NewValues : BV16 +-> BYTE  /*&  !(elem).( elem : dom(NewValues) => bv16_ushort(elem) : STACK_R_ADR)*/
    THEN
        mem:= mem <+ NewValues 
    END;
    
    updateAddressStack(address, value) =
    PRE address : BV16 & value : BYTE /*&  bv16_ushort(address) : STACK_R_ADR   */
    THEN
        mem:= mem <+ { address |-> value }
    END
    
END