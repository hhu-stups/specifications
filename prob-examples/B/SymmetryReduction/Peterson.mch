/*  Peterson's algorithm (mutual exclusion for n-processes)   
    References: 						       	       	  
    Peterson, G.L.,  Myths about the mutual exclusion problem,             
    Information processing letters, Vol 12, No 3, 1981.                    
*/

MACHINE Peterson

/*
Const
  N: 7;	

Type
  --  The scalarset is used for symmetry, which is implemented in Murphi 1.5
  --  and not upgraded to Murphi 2.0 yet
  pid: scalarset (N);
  -- pid: 1..N;
  priority: 0..N;
  label_t: Enum{L0, -- : non critical section; j := 1; while j<n do
		L1,  -- : Beginwhile Q[i] := j
		L2,  -- : turn[j] := i
		L3,  -- : wait until (forall k != i, Q[k] < j) or turn[j] != i ; j++; Endwhile
		L4   -- : critical section; Q[i] := 0
 		};
Var
  P: Array [ pid ] Of label_t;
  Q: Array [ pid ] Of priority;
  turn: Array [ priority ] Of pid;
  localj: Array [ pid ] Of priority;
*/

SETS
	PID  ;
	label_t = {L0,L1,L2,L3,L4}
DEFINITIONS
        scope_PID == 1..4
CONSTANTS
	N
PROPERTIES
	N:NATURAL1 & N>1 & card(PID)=N
VARIABLES
	P,
	Q,
	turn,
	localj

/*
Invariant
  ! Exists i1: pid Do
    Exists i2: pid Do
      ( i1 != i2
      & P[i1] = L4 -- critical
      & P[i2] = L4 -- critical
      )
    End  --Exists
    End; --Exists
*/

INVARIANT
	P:(PID -->label_t) &
	Q:(PID --> (0..N)) &
	turn:((1..N) +-> PID) &
	localj:(PID+->(0..N)) &
	not(#(i1,i2).(i1:PID & i2:PID & (not (i1=i2)) & P(i1)=L4 & P(i2)=L4)) 

INITIALISATION
/*
Startstate
Begin
  For i:pid Do
    P[i] := L0;
    Q[i] := 0;
  End; --For

  For i: priority Do
    Undefine turn[i];
  End; --For

  Clear localj;
End;  
*/
	P:= {i,L|i:PID&L:label_t&L=L0}||  
	Q:= {i,v|i:PID&v:NAT&v=0} || 
	localj := {} ||
	turn := {} 	

OPERATIONS

/* Ruleset i: pid  Do */

/*  Rule "execute inc j and while"
    P[i] = L0  ==>
  Begin
    localj[i] := 1;
    P[i] := L1; 
  End;
*/
	Inc_j_and_while(i) = PRE i:PID & P(i)=L0 THEN 
			    localj(i):=1 ||
			    P(i):=L1
			    END;


/*  Rule "execute assign Qi j"
    P[i] = L1  ==>
  Begin
    Q[i] := localj[i];
    P[i] := L2; 
  End;
*/

	assign_Qi_j(i) = PRE i:PID & P(i)=L1 THEN
		       Q(i):=localj(i) ||
		       P(i):=L2
		       END;

/*  Rule "execute assign TURNj i"
    P[i] = L2  ==>
  Begin
    turn[localj[i]]  := i;
    P[i] := L3; 
  End;
*/

	assign_TURN_j(i) = PRE i:PID & P(i) = L2 THEN
	    		turn(localj(i))  := i ||
    	    		P(i) := L3 
  	    		END;

/*  Rule "execute wait until"
    P[i] = L3  ==>
  Begin
    If ( Forall k: pid Do
           ( k!=i ) -> ( Q[k]<localj[i] )
         End --forall
       | ( turn[localj[i]] != i ) )
    Then
      localj[i] := localj[i] + 1;
      If ( localj[i]<N )
      Then
        P[i] := L1; 
      Else
        P[i] := L4; 
      End; --If 
    End; --If
  End;*/

	wait_until(i) = PRE  (i:PID & P(i) = L3) THEN
			IF  (!(k).(k:PID-{i}=>  Q(k)<localj(i))) or  
			     not(turn(localj(i)) = i ) THEN 
		      		IF localj(i)<N-1 THEN
					localj(i) := localj(i) + 1|| P(i) := L1 
				ELSE
					localj(i) := localj(i) + 1|| P(i) := L4
				END 
			END
			END;


/*  Rule "execute critical and assign Qi 0"
    P[i] = L4  ==>
  Begin
    Q[i] := 1;
    P[i] := L0;
  End; 

End; --Ruleset
*/

	critical_and_assign_Qi_0(i) = PRE  i:PID & P(i)= L4  THEN
		Q(i) := 1||
    		P(i) := L0
		END
	
END