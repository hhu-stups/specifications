/*************************************************************************
Copyright (c) 2009,  David Deharbe, Valerio Medeiros Jr.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of the Universidade Federal do Rio Grande do Norte nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*************************************************************************/
MACHINE
    MEMORY
    
SEES
    ALU,
    BIT_DEFINITION ,
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
    /*Partial Function - Simplification ProB*/
    mem : BV16 --> BYTE 
    
    
ASSERTIONS
    
    ran(mem) <: BYTE &
    /* We need prove this - Simplification ProB*/
    dom(mem) = BV16 & 
    
    !(address,value).( address : BV16 & value : BYTE =>    mem <+ { address |-> value } : BV16 --> BYTE ) 
    
    /*  More security mode & PROGRAM_R_ADR /\ DATA_R_ADR /\ STACK_R_ADR = {}  */
    
    
INITIALISATION
    mem := %(xx).(xx : BV16 | [0,0,0,0 ,0,0,0,0] ) /*BV16 --> BYTE */
    
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