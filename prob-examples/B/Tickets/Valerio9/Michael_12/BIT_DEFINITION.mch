/*************************************************************************
Copyright (c) 2009,  David Deharbe, Stephenson Galvao, Valerio Medeiros Jr.

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
/*
	This machine especific the type BIT and its properties
	
Author: David Deharbe, Stephenson Galvao,  Valerio Medeiros Jr.
Creation date: Tue Feb 10 2009
Universidade Federal do Rio Grande do Norte
Departamento de Informatica e Matematica Aplicada
Programa de Pos-Graduacao em Sistemas e Computacao
Formal Methods and Languages Laboratory 
*/

MACHINE
	BIT_DEFINITION

CONSTANTS
	BIT,
	bit_not,
	bit_and,
	bit_or,
	bit_xor,
	bool_bit

PROPERTIES
	BIT = {0,1} 
	
	& bit_not : BIT >->> BIT 
	& bit_not = { 0 |-> 1 } \/ { 1 |-> 0 }
	
    
    & bit_and : BIT * BIT --> BIT 
    & bit_and = ({ (0, 0) |-> 0 } \/ { (0, 1) |-> 0 } \/ { (1, 0) |-> 0 } \/ { (1, 1) |-> 1})
    
    
 
	& bit_or : BIT * BIT --> BIT 
	& bit_or = ({ (0, 0) |-> 0 } \/ { (0, 1) |-> 1 } \/ { (1, 0) |-> 1 } \/ { (1, 1) |-> 1})
	
		
	& bit_xor : BIT * BIT --> BIT 
	& bit_xor =  ({ (0, 0) |-> 0 } \/ { (0, 1) |-> 1 } \/ { (1, 0) |-> 1 } \/ { (1, 1) |-> 0})
	
	/*	& bool_bit : BOOL --> BIT */
	& bool_bit = { TRUE |-> 1, FALSE |-> 0 }

ASSERTIONS
        
    ! (bb). (bb : BIT => bit_not(bb) = 1-bb) 

	& dom(bit_and)=BIT*BIT
	& ran(bit_not)=BIT 
	& bit_not(0) = 1
	& bit_not(1) = 0
	& !(bb).(bb : BIT => bit_not(bit_not(bb)) = bb)

	& dom(bit_and)=BIT*BIT
	& ran(bit_and)=BIT 
	& bit_and(0,0) = 0
	& bit_and(0,1) = 0
	& bit_and(1,0) = 0
	& bit_and(1,1) = 1
	
	& !(b1,b2).(b1 : BIT & b2 : BIT => (bit_and(b1, b2) = bit_and(b2,b1))  )
	& !(b1,b2).(b1 : BIT & b2 : BIT & bit_and(b1, b2)=1 => bit_and(b2,b1)=1 )
	& !(b1,b2).(b1 : BIT & b2 : BIT & bit_and(b1, b2)=0 => bit_and(b2,b1)=0 )
	
	& !(b1,b2,b3).(b1 : BIT & b2 : BIT & b3 : BIT => (bit_and(b1, bit_and(b2,b3)) = bit_and(bit_and(b1,b2),b3)))
	& !(b1).(b1 : BIT => (bit_and(b1, 1) = b1))
	& !(b1).(b1 : BIT => (bit_and(b1, 0) = 0))

	& dom(bit_or)=BIT*BIT
	& ran(bit_or)=BIT 
	& bit_or(0,0) = 0
	& bit_or(0,1) = 1
	& bit_or(1,0) = 1
	& bit_or(1,1) = 1
	& !(b1, b2).(b1 : BIT & b2 : BIT => (bit_or(b1, b2) = bit_or(b2,b1)))
	& !(b1, b2).(b1 : BIT & b2 : BIT & bit_or(b1, b2)=1 => bit_or(b2,b1)=1) 
	& !(b1, b2).(b1 : BIT & b2 : BIT & bit_or(b1, b2)=0 => bit_or(b2,b1)=0)
	& !(b1, b2).(b1 : BIT & b2 : BIT & bit_or(b1,0)=1 => b1=1)
	& !(b1, b2).(b1 : BIT & b2 : BIT & bit_or(b1,0)=0 => b1=0)
	
 	
	& !(b1,b2,b3).(b1 : BIT & b2 : BIT & b3 : BIT => (bit_or(b1, bit_or(b2,b3)) = bit_or(bit_or(b1,b2),b3)))
	& !(b1,b2,b3).(b1 : BIT & b2 : BIT & b3 : BIT & bit_or(b1,b2)=1 => bit_or(b1,bit_or(b2,b3))=1)
	& !(b1,b2,b3).(b1 : BIT & b2 : BIT & b3 : BIT & bit_or(b1,b2)=1 => bit_or(b1, bit_or(b2,b3)) = bit_or(1,b3))
	& !(b1).(b1 : BIT => (bit_or(b1, 1) = 1))
	& !(b1).(b1 : BIT => (bit_or(b1, 0) = b1))
	& !(b1).(b1 : BIT => (bit_or(1,b1) = 1))
	& !(b1).(b1 : BIT => (bit_or(0,b1) = b1))

	& dom(bit_xor)=BIT*BIT
	& ran(bit_xor)=BIT  
	& bit_xor(0,0) = 0
	& bit_xor(0,1) = 1
	& bit_xor(1,0) = 1
	& bit_xor(1,1) = 0
	& !(b1, b2).(b1 : BIT & b2 : BIT => (bit_xor(b1, b2) = bit_xor(b2,b1)))
	& !(b1, b2).(b1 : BIT & b2:BIT & bit_xor(b1, b2)=1 => bit_xor(b2,b1)=1)
	& !(b1, b2).(b1 : BIT & b2:BIT & bit_xor(b1, b2)=0 => bit_xor(b2,b1)=0)
	
	& !(b1,b2,b3).(b1 : BIT & b2 : BIT & b3 : BIT => (bit_xor(b1, bit_xor(b2,b3)) = bit_xor(bit_xor(b1,b2),b3)))
	& !(b1,b2,b3).(b1 : BIT & b2 : BIT & b3 : BIT & bit_xor(b1,b2)=1 => bit_xor(b1, bit_xor(b2,b3)) = bit_xor(1,b3))/*pode tirar*/
	
	& !(bb).(bb : BIT => bit_xor(bb,bb) = 0)

	& dom(bool_bit)=BOOL
	& ran(bit_xor)=BIT
	& bool_bit(TRUE) = 1
	& bool_bit(FALSE) = 0

	& !(bb).(bb : BIT => bb = 0 or bb = 1)
	& !(bb).(bb : BIT & not (bb = 0) => bb = 1)
	& !(bb).(bb : BIT & not (bb = 1) => bb = 0)

END