/*
/brief
	This machine especific the type BIT and its properties
	
Author: Valerio Jr, Stephenson Galvao, David Deharbe
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
	BIT = 0..1 
	
	& bit_not : BIT --> BIT 
	& bit_not = %(bb).(bb:BIT | 1-bb)
	
    
	& bit_and : BIT * BIT --> BIT 
	& (!(b1, b2).(b1 : BIT & b2 : BIT => ((bit_and(b1, b2) = 1) <=> ((b1 = 1) & (b2 = 1)))))
	/*
	Teria como colocar bit_and em expressões lambda?
	
	& bit_and = %(b1,b2).(b1:BIT & b2:BIT & ((b1 = 1) & (b2 = 1))| 1) \/
				%(b1,b2).(b1:BIT & b2:BIT & not((b1 = 1) & (b2 = 1))| 0)
	*/		
	
	& bit_or : BIT * BIT --> BIT 
	& (!(b1, b2).(b1 : BIT & b2 : BIT => ((bit_or(b1, b2) = 1) <=> ((b1 = 1) or (b2 = 1)))))
	
	/*
	Teria como colocar bit_aor em expressões lambda?
	& bit_or = %(b1,b2).(b1:BIT & b2:BIT & ((b1 = 1) or (b2 = 1))| 1) \/
			   %(b1,b2).(b1:BIT & b2:BIT & not((b1 = 1) or (b2 = 1))| 0)
	*/
	
	& bit_xor : BIT * BIT --> BIT 
	& ! (b1, b2).(b1 : BIT & b2 : BIT => ((bit_xor(b1, b2) = 1) <=> (b1 /= b2)  ))
	
	/*
	Teria como colocar bit_xor em expressões lambda?
	& bit_xor = %(b1,b2).(b1:BIT & b2:BIT & not(b1 = b2)| 1) \/
			    %(b1,b2).(b1:BIT & b2:BIT & (b1 = b2 )| 0)
	*/
	& bool_bit : BOOL --> BIT 
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
	& !(b1,b2,b3).(b1 : BIT & b2 : BIT & b3 : BIT & bit_xor(b1,b2)=1 => bit_xor(b1,bit_xor(b2,b3))=1)/*pode tirar*/
	& !(b1,b2,b3).(b1 : BIT & b2 : BIT & b3 : BIT & bit_xor(b1,b2)=1 => bit_xor(b1, bit_xor(b2,b3)) = bit_xor(1,b3))/*pode tirar*/
	
	& !(bb).(bb : BIT => bit_xor(bb,bb) = 0)

	& dom(bool_bit)=BOOL
	& ran(bit_xor)=BIT
	& bool_bit(TRUE) = 1
	& bool_bit(FALSE) = 0

	& !(bb).(bb : BIT => bb = 0 or bb = 1)
	& !(bb).(bb : BIT & not (bb = 0) => bb = 1)
	& !(bb).(bb : BIT & not (bb = 1) => bb = 0)
OPERATIONS
 res <-- Test_And(a,b) = PRE a : BIT & b: BIT THEN
   res := bit_and(a,b)
 END;
 res <-- Test_Or(a,b) = PRE a : BIT & b: BIT THEN
   res := bit_or(a,b)
 END;
 res <-- Test_XOr(a,b) = PRE a : BIT & b: BIT THEN
   res := bit_xor(a,b)
 END

END