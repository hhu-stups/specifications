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
    UCHAR_DEFINITION
    
SEES
    
    
    BIT_DEFINITION,
    BYTE_DEFINITION,
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
    pow2_8 == 256
 
CONSTANTS
    
   UCHAR_MAX,
   UCHAR_MIN,      
    
    
   UCHAR ,
   uchar_byte,
   byte_uchar 
   
PROPERTIES
    
   UCHAR_MAX = pow2_8 - 1 &
   UCHAR_MIN = 0  &
     
   UCHAR = ( UCHAR_MIN .. UCHAR_MAX) &

   /*byte_uchar : BYTE  >->>  UCHAR &*/
   byte_uchar =  % ( v0 ) . ( v0 : BYTE |  pow2_7*v0(8)+pow2_6 *v0(7)+ pow2_5*v0(6)+pow2_4*v0(5) +
   pow2_3 * v0(4 ) + pow2_2 *v0(3) + pow2_1 * v0(2) + pow2_0 * v0(1) )&

  	/*uchar_byte :  UCHAR >->>  BYTE 	&	*/
	uchar_byte = % ( v0 ) . ( v0 : UCHAR  | 
         [(v0 mod pow2_1)/pow2_0,
         (v0 mod pow2_2)/pow2_1,
         (v0 mod pow2_3)/pow2_2,
         (v0 mod pow2_4)/pow2_3,
         (v0 mod pow2_5)/pow2_4,
         (v0 mod pow2_6)/pow2_5,
         (v0 mod pow2_7)/pow2_6, 
         (v0 mod pow2_8)/pow2_7]  )
 
  

ASSERTIONS

    card(byte_uchar) = 256 &
    card(uchar_byte) = 256 &

							/* ProB */ 

    UCHAR_MAX : INTEGER &
    UCHAR_MIN : INTEGER &
           
    pow2_0 = 2**0 &
    pow2_1 = 2**1 &
    pow2_2 = 2**2 &
    pow2_3 = 2**3 &
    pow2_4 = 2**4 &
    pow2_5 = 2**5 &
    pow2_6 = 2**6 &
    pow2_7 = 2**7 &
    pow2_8 = 2**8
 
    
END

