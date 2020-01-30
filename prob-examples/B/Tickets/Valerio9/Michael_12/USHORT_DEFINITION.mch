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
    USHORT_DEFINITION
SEES
    BIT_DEFINITION,
    BYTE_DEFINITION,
    BV16_DEFINITION,
    UCHAR_DEFINITION,
    POWER2
            
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
    
CONSTANTS
    
    USHORT_MAX,
    USHORT_MIN,
    
    USHORT,
    bv16_ushort,
    ushort_bv16,
    
    uchar_ushort
   
    
PROPERTIES
    
   USHORT_MAX =  (pow2_16) -1 &
   USHORT_MIN =  0 &

   USHORT = USHORT_MIN..USHORT_MAX &
   
   /*bv16_ushort : BV16 >->> USHORT &  ProB simplification */
   bv16_ushort =% ( v0 ) . ( v0 : BV16 |
   pow2_15*v0(16)+pow2_14 *v0(15)+ pow2_13*v0(14)+pow2_12*v0(13) +
   pow2_11*v0(12)+pow2_10 *v0(11)+ pow2_9 * v0(10) + pow2_8 * v0(9)+
   pow2_7*v0(8)+pow2_6 *v0(7)+ pow2_5*v0(6)+pow2_4*v0(5) +
   pow2_3 * v0(4 ) + pow2_2 *v0(3) + pow2_1 * v0(2) + pow2_0 * v0(1) ) &

   /*ushort_bv16 : USHORT >->> BV16 &  ProB simplifcation */
   ushort_bv16 = % ( v0 ) . ( v0 : USHORT  |
	    [   (v0 mod pow2_1)/pow2_0,
	        (v0 mod pow2_2)/pow2_1,
	        (v0 mod pow2_3)/pow2_2,
         	(v0 mod pow2_4)/pow2_3,
         	(v0 mod pow2_5)/pow2_4,
         	(v0 mod pow2_6)/pow2_5,
         	(v0 mod pow2_7)/pow2_6, 
         	(v0 mod pow2_8)/pow2_7,
         
         	(v0 mod pow2_9)/pow2_8,
         	(v0 mod pow2_10)/pow2_9,
         	(v0 mod pow2_11)/pow2_10,
         	(v0 mod pow2_12)/pow2_11,
         	(v0 mod pow2_13)/pow2_12,
         	(v0 mod pow2_14)/pow2_13,
         	(v0 mod pow2_15)/pow2_14,
         	(v0 mod pow2_16)/pow2_15	 ])
	    
							
        &
        
        
   /*uchar_ushort: UCHAR * UCHAR --> USHORT & ProB simplification*/
   uchar_ushort = % ( w1 , w2 ).( w1 : UCHAR & w2 : UCHAR |  bv16_ushort( byte_bv16 ( uchar_byte ( w1 ) , uchar_byte ( w2 ) ) ) ) 
   
    
    
ASSERTIONS


    card(bv16_ushort)=pow2_16 &
    card(ushort_bv16)=pow2_16 &
 
   
    USHORT_MAX : INTEGER &
    USHORT_MIN : INTEGER &
    

    
    pow2_0 = 2**0 &
    pow2_1 = 2**1 &
    pow2_2 = 2**2 &
    pow2_3 = 2**3 &
    pow2_4 = 2**4 &
    pow2_5 = 2**5 &
    pow2_6 = 2**6 &
    pow2_7 = 2**7 &
    pow2_8 = 2**8 &
    pow2_9 = 2**9 &    
    pow2_10 = 2**10 &
    pow2_11 = 2**11 &
    pow2_12 = 2**12 &
    pow2_13 = 2**13 &
    pow2_14 = 2**14 &
    pow2_15 = 2**15 &
    pow2_16 = 2**16 
    
END
