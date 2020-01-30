MACHINE JavaBC0_TLC
/* A Version where each BYTECode is represented by an individual operation */
/* Version v3
    v3: added various properties (StackLayout(1) = 0,...); split Program into three total functions,
        proved it correct
    v1: 7 March 2008: added query predicates
*/
SETS
   Opcodes = {nop, return, goto, istore, iload, iconst, pop, ifle, iinc, imul, iadd}
DEFINITIONS
  /* BYTE == -2..30; */
   SET_PREF_MAXINT == 32;
   AdvancePC == BEGIN PC := PC+1 END;
   GOAL == (Finished=TRUE);
   TOPStackxx == (Stack(size(Stack)));
   TOP2Stackxx == (Stack(size(Stack)-1));
   TAILStackxx == (1..(size(Stack)-1) <| Stack );
   TAIL2Stackxx == (1..(size(Stack)-2)  <| Stack );
   TOPStack == (last(Stack));
   TOP2Stack == (Stack(size(Stack)-1));
   TAILStack == (front(Stack) );
   TAIL2Stack == (front(front(Stack)) )
CONSTANTS
  PrgOpcode, PrgArg1, PrgArg2, Exp, StackLayout, BYTE, MAXVAR, VARS, MAXBYTE, PSIZE
PROPERTIES
   MAXBYTE = 31 & /* 127 & */
   BYTE = (-MAXBYTE-1)..MAXBYTE &
   MAXVAR = 2*MAXBYTE+1 & MAXBYTE < MAXVAR &
   VARS = 0..MAXVAR &
   PSIZE : 1..MAXINT & /* NATURAL1 & */ 
   PrgOpcode: 1..PSIZE --> Opcodes &
   PrgArg1: 1..PSIZE --> VARS &
   PrgArg2: 1..PSIZE --> BYTE &
  
  Exp: VARS &   Exp = 5 
  & PrgOpcode = [            
        iconst, istore, iconst, istore, iload,
        istore, iconst, istore, iload, ifle,
        iinc, iload, iload,  imul, istore,
        goto, return 
        ] & 
    PrgArg1 = [ 
           2,1,Exp, 2,2,
           3,1,4,3,17,
           3,4,1,0,4,
           9,0
        ] &
    PrgArg2 = [       
           0,0,0,0,0,
           0,0,0,0,0,
           -1,0,0,0,0,
           0,0
        ] 
/* The above is the bytecode for
    int base = 2;
	int exp = 5;
	int i = exp;
	int res = 1;
	while (i>0) {
		i--;
		res = res*base;
	}
 */
  &
   StackLayout: 1..PSIZE --> VARS  /* for each Program Point: indicate size of stack;
     in more elaborate versions we will need to remember types of elements on the stack */
     &
   StackLayout(1) = 0 & /* initially the stack is empty */

   StackLayout = [  0, 1, 0, 1, 0, 1, 0, 1, 0, /*after Pos9:*/  1, 0, 0, 1, 2, 1, 0, 0  ] 
   & 

  !pc1.(pc1:1..PSIZE =>
          ((PrgOpcode(pc1)/=goto & PrgOpcode(pc1)/=return) => pc1+1 <= PSIZE ))
 &
   !pc2.(pc2:1..PSIZE & PrgOpcode(pc2) = goto 
                 => (PrgArg1(pc2):1..PSIZE &
                                  StackLayout(PrgArg1(pc2)) = StackLayout(pc2)) )
 &
   !pc2.(pc2:1..PSIZE & PrgOpcode(pc2) = ifle
                 => (PrgArg1(pc2):1..PSIZE &
                                  StackLayout(PrgArg1(pc2)) = StackLayout(pc2)-1) )
 &
   !pc.(pc:1..PSIZE =>
           ((PrgOpcode(pc) = imul or PrgOpcode(pc) = iadd)
             => (StackLayout(pc) > 1 & StackLayout(pc+1) = StackLayout(pc)-1)
           ) & 
           ((PrgOpcode(pc) = istore or PrgOpcode(pc) = ifle or PrgOpcode(pc) = pop)
             => (StackLayout(pc) > 0 & StackLayout(pc+1) = StackLayout(pc)-1)
           ) & 
           ((PrgOpcode(pc) = iconst or PrgOpcode(pc) = iload)
             =>  StackLayout(pc+1) = StackLayout(pc)+1
           ) & 
           ((PrgOpcode(pc) = nop or PrgOpcode(pc) = iinc)
             =>  StackLayout(pc+1) = StackLayout(pc)
           ) 
           
        )
        /*&
        Cannot do this:
  !pca1.(pca1:1..PSIZE =>
               ((PrgOpcode(pca1) = iload or PrgOpcode(pca1) = iinc)
                 => PrgArg1(pca1) : dom(Vars) )) */
                 
              /*   &
  (!ss.(ss:seq(INTEGER) & size(ss)>0 => size(front(ss)) = size(ss)-1))  */ /* Cannot be proven ! hence in Properties*/
 /*  &
   (!(x,ss).(x:INTEGER & ss:seq(INTEGER) => size(x -> ss) = size(ss)+1))
  */
VARIABLES
  PC, Stack, Vars, Finished
ASSERTIONS
  ((PrgOpcode(PC)/=goto & PrgOpcode(PC)/=return) => PC+1 :  1..PSIZE );
  /*(PrgOpcode(PC)=nop => PC+1 :  1..PSIZE );
  (PrgOpcode(PC)=istore => PC+1 :  1..PSIZE );
  (PrgOpcode(PC)=iconst => PC+1 :  1..PSIZE );
  (PrgOpcode(PC)=iload => PC+1 :  1..PSIZE );
  (PrgOpcode(PC)=imul => PC+1 :  1..PSIZE );
  (PrgOpcode(PC)=iadd => PC+1 :  1..PSIZE );*/
  (!x.(x: 0..MAXINT & x>=0 => card(1..x) = x))
 /* ; (size(Stack)>0 => dom(TAILStack) = 1..card(TAILStack)) */;
  (size(Stack)>0 => size(front(Stack)) = size(Stack)-1) 
INVARIANT
  PC: 1..PSIZE &
  /* Stack: INTEGER +-> INTEGER &
  dom(Stack) = 1..card(Stack) & */
  Stack: seq(INTEGER) &
  Vars: VARS +->INTEGER &
  Finished: BOOL &
  
  size(Stack) = StackLayout(PC)
INITIALISATION
  PC := 1 ||
  Stack := [] ||
  Vars := {} ||
  Finished := FALSE
OPERATIONS
 /* Following Query Operations make ProB Refinement Checking more precise: 
    (actually forces ProB to check part of the gluing invariant) */
   sz <-- StackSize = BEGIN sz := size(Stack) END;
   tp <-- StackTop =  PRE size(Stack)>0 THEN tp := TOPStack END;
   vv <-- NzVarVal(var) = PRE var:VARS & var:dom(Vars) THEN
             SELECT Vars(var) /= 0 THEN vv:= Vars(var) END
          END;
   terminate = PRE Finished=TRUE THEN skip END;
    ex_nop = PRE PrgOpcode(PC) = nop  THEN
          AdvancePC
      END;
   ex_goto(A1) = PRE PrgOpcode(PC) = goto  & A1=PrgArg1(PC) THEN
                     PC := PrgArg1(PC)
       END;
   ex_return = PRE PrgOpcode(PC) =return & Finished= FALSE THEN
          Finished := TRUE
      END;
   ex_ifle(A1) = PRE PrgOpcode(PC) = ifle  & A1=PrgArg1(PC) THEN
       IF TOPStack <= 0 THEN
           PC := A1
       ELSE
           AdvancePC
       END ||
       Stack := TAILStack
    END;
    /* ex_pop = PRE PrgOpcode(PC) = pop THEN
          AdvancePC
       END;
    */
    ex_istore(A1) = PRE PrgOpcode(PC) = istore & A1=PrgArg1(PC) THEN
          AdvancePC ||
          Stack := TAILStack ||
	      Vars(A1) := TOPStack
       END; 
    ex_iconst(A1) = PRE PrgOpcode(PC) = iconst  & A1=PrgArg1(PC) & A1<=MAXBYTE THEN
          AdvancePC ||
          Stack := Stack <- A1
       END; 
   /* ex_iconst_neg(A1) = PRE PrgOpcode(PC) = iconst  & A1=PrgArg1(PC) & A1>MAXBYTE THEN
          AdvancePC ||
          Stack := (A1-MAXBYTE-1) -> Stack
       END; */
    ex_iload(A1) = PRE PrgOpcode(PC) = iload  & A1=PrgArg1(PC) &  A1:dom(Vars) THEN
          AdvancePC ||
          Stack := Stack <- Vars(A1)
       END; 
   ex_imul = PRE PrgOpcode(PC) = imul  THEN
          Stack := TAIL2Stack <- (TOPStack*TOP2Stack) ||
          AdvancePC
       END;
   ex_iadd = PRE PrgOpcode(PC) = iadd  THEN
          Stack := TAIL2Stack <- (TOPStack+TOP2Stack) ||
          AdvancePC
       END;
   ex_iinc(A1,A2) = PRE PrgOpcode(PC) = iinc  & A1=PrgArg1(PC) & A2=PrgArg2(PC) &  A1:dom(Vars) THEN
          Vars(A1) := Vars(A1)+A2 ||
          AdvancePC
       END;
   opc <-- current_opcode = BEGIN opc := PrgOpcode(PC) END
END
             
             