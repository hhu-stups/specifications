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
    BV16_DEFINITION    
SEES 
	BIT_DEFINITION,
	BYTE_DEFINITION
	
DEFINITIONS
	BV16_WIDTH == 16;
	SET_PREF_SYMBOLIC == TRUE
	
CONSTANTS 
	BV16_INDX,
	PHYS_BV16_INDEX,

	BV16,
	bv16_byte,
	byte_bv16,
	complement16
	
PROPERTIES 

   BV16_INDX = 1..(BV16_WIDTH) &
   PHYS_BV16_INDEX = 0..(BV16_WIDTH-1) &
   BV16 = (BV16_INDX --> BIT)  & card(BV16)= 65536 &
   !(b1).(b1 : BV16 => size(b1)=BV16_WIDTH & b1 : seq1(BIT)) & 
	
   complement16 = %(bt).(bt : BV16 | %(idx).(idx : 1..16|bit_not(bt(idx) ) ) ) &
 
   
 
	bv16_byte = %(bv).(bv:BV16 | ( { 8|->bv(16),7|->bv(15),6|->bv(14),5|->bv(13),4|->bv(12),3|->bv(11),2|->bv(10),1|->bv(9)}
	                             , { 8|->bv(8) ,7|->bv(7) ,6|->bv(6) ,5|->bv(5) ,4|->bv(4) ,3|->bv(3) ,2|->bv(2) ,1|->bv(1)}) ) &


	byte_bv16 = %(bv1,bv2).(bv1: BYTE & bv2 : BYTE |
	    ( { 16|->bv1(8),15|->bv1(7),14|->bv1(6),13|->bv1(5),12|->bv1(4),11|->bv1(3), 10|->bv1(2),9|->bv1(1)
           , 8|->bv2(8),7 |->bv2(7),6 |->bv2(6), 5|->bv2(5), 4|->bv2(4),3 |->bv2(3), 2 |->bv2(2),1|->bv2(1) } ))  

ASSERTIONS
    
    card(BV16) = 65536 &

    complement16 : BV16 --> BV16 &
    
    byte_bv16 = bv16_byte~ &

    [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] : BV16 &
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] : BV16
    
END
