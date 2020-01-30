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
    TYPES
    
SEES
    UCHAR_DEFINITION,
    SCHAR_DEFINITION,
    
    USHORT_DEFINITION,
    SSHORT_DEFINITION,    

    BYTE_DEFINITION,
    BV16_DEFINITION,
    BIT_DEFINITION
        
DEFINITIONS
    
    SET_PREF_SYMBOLIC == TRUE;
    
    pow2_0 == 1;
    pow2_1 == 2;
    pow2_2 == 4;
    pow2_3 == 8;
    pow2_4 == 16;
    pow2_5 == 32;
    pow2_6 == 64;
    pow2_7 == 128;
    pow2_8 == 256;
    pow2_9 == 512;
    pow2_10 == 1024;    
    pow2_11 == 2048;  
    pow2_12 == 4096;   
    pow2_13 == 8192;
    pow2_14 == 16384;   
    pow2_15 == 32768; 
    pow2_16 == 65536    
    
ASSERTIONS
    
    /*  PROPERTIES
        func : TYPE1 +-> TYPE2              =>  FUNCTION
        dom(func) = TYPE1                   =>  TOTAL FUNCTION
        ran(func) = TYPE2                   =>  SURJECTIVE
        func~ : TYPE2 +-> TYPE1             =>  INJECTIVE AND INVERSIVE FUNCTION 
        func = (func~)~                     =>  EQUAL ITS INVERSE FUNCTION
    */

    /*UCHAR_DEFINITION     */
    byte_uchar : BYTE  >->> UCHAR &
    uchar_byte : UCHAR >->> BYTE 	&
    byte_uchar = uchar_byte~ &
    
    
    /*SCHAR_DEFINITION    */
    schar_uchar : SCHAR >->>  UCHAR &
    uchar_schar : UCHAR >->>  SCHAR & 
    schar_uchar = uchar_schar~ &
    
    byte_schar : BYTE  >->>  SCHAR &
    schar_byte : SCHAR >->>  BYTE 	&
    byte_schar = schar_byte~ &
    
    

    /* BV16_DEFINITION    */
    bv16_byte : ( BV16  >->> (BYTE * BYTE)) &
    byte_bv16 : ((BYTE * BYTE) >->> BV16 ) &
    bv16_byte = byte_bv16~ &
    
    
    /* USHORT_DEFINITION */
    bv16_ushort :  BV16   >->>  USHORT &
    ushort_bv16 :  USHORT >->>  BV16  &
    bv16_ushort = ushort_bv16~ &
     
    uchar_ushort : (UCHAR * UCHAR) >->>  USHORT &
     
   
     /* SSHORT_DEFINITION */
    
     bv16_sshort : BV16  >->> SSHORT &    
     sshort_bv16 : SSHORT >->> BV16 & 
     bv16_sshort = sshort_bv16~ &

     schar_sshort  : (SCHAR * SCHAR) >->>  SSHORT &
     /*Novas regras */
     sshort_ushort : SSHORT >->> USHORT &
     ushort_sshort : USHORT >->> SSHORT &
     sshort_ushort = ushort_sshort~
     
     /*&
     card(ushort_sshort) = pow2_16 &
     card(sshort_ushort) = pow2_16 &
     card(bv16_sshort) = pow2_16 &
     card(sshort_bv16) = pow2_16 &
     card(schar_sshort)=pow2_16 
     */
    
END
