MACHINE FastPaxos
SETS
 ENUM1 = {any, v1, v2, noVal1}; ENUM2 = {a1, a2, a3, noVal2}
ABSTRACT_CONSTANTS PVal, Acceptor, FastNum, ClassicNum
PROPERTIES
 PVal = {v1, v2}
 & Acceptor = ENUM2
 & FastNum = {2}
 & ClassicNum = {1, 3}
 & FastNum /\ ClassicNum = {}
 & !i,j,k.(i : RNum & j : RNum & k : RNum => (prec(i, j) & prec(j, k) => prec(i, k)))
 & !i.(i : RNum => not(prec(i, i)))
 & !i,j.(i : RNum & j : RNum => preceq(i, j) or preceq(j, i))
 & (0 /: RNum & !i.(i : RNum => prec(0, i)))
 & !i.(i : FastNum => (NextNum(i) : RNum => not(#j.(j : RNum & (prec(i, j) & prec(j, NextNum(i)))))))
DEFINITIONS
 NextNum(a) == (%t_.( t_ = 0 & a + 1 : FastNum \/ ClassicNum | a + 1 )\/%t_.( t_ = 0 & not(a + 1 : FastNum \/ ClassicNum) | 0 ))(0);

 RNum == FastNum \/ ClassicNum;

 Message == struct(type : {"propose"},rnd : INTEGER,pval : PVal,acc : ENUM2,vrnd : INTEGER) \/ struct(type : {"phase1a"},rnd : RNum,pval : ENUM1,acc : ENUM2,vrnd : INTEGER) \/ struct(type : {"phase1b"},rnd : RNum,pval : PVal \/ {any},acc : Acceptor,vrnd : RNum \/ {0}) \/ struct(type : {"phase2a"},rnd : RNum,pval : PVal \/ {any},acc : ENUM2,vrnd : INTEGER) \/ struct(type : {"phase2b"},rnd : RNum,pval : PVal,acc : Acceptor,vrnd : INTEGER);

 Quorum(i) == (%t_.( t_ = 0 & i : ClassicNum | {{a1, a2}, {a1, a3}, {a2, a3}} )\/%t_.( t_ = 0 & not(i : ClassicNum) | {{a1, a2, a3}} ))(0);

 prec(i,j) == i < j;

 preceq(i,j) == prec(i, j) or i = j;

 TypeOK == rnd : Acceptor --> RNum \/ {0}
	 & vrnd : Acceptor --> RNum \/ {0}
	 & pval : Acceptor --> PVal \/ {any}
	 & sentMsg : POW(Message)
	 & learned : POW(PVal);

 Send(m) == sentMsg_n = sentMsg \/ {m};

 Propose(v) == Send(rec(type : "propose",rnd : 0,pval : v,acc : noVal2,vrnd : 0))
	 & TRUE = TRUE;

 Phase1a(i) == Send(rec(type : "phase1a",rnd : i,pval : noVal1,acc : noVal2,vrnd : 0))
	 & TRUE = TRUE;

 Phase1b(a,i) == prec(rnd(a), i)
	 & #m.(m : sentMsg & (m'type = "phase1a" & m'rnd = i))
	 & rnd_n = rnd <+ {a |-> i}
	 & Send(rec(type : "phase1b",rnd : i,pval : pval(a),acc : a,vrnd : vrnd(a)))
	 & TRUE = TRUE;

 /*P1bMsg(Q,i) == {m|m : sentMsg & m'type = "phase1b" & m'acc : Q & m'rnd = i};*/ /*diese Definition fehlt*/

 k(M, Q, i) == max({t_|#m.(m : M & t_ = m'vrnd)});
 Vk(M, Q, i) == {t_|#m.(m : {mm|mm : M & mm'vrnd = k(M, Q, i)} & t_ = m'pval)};
 Only(v, M, Q, i) == Vk(M, Q, i) = {v}
	 or (k(M, Q, i) : FastNum
	 & #R.(R : Quorum(k(M, Q, i)) & !a.(a : Q /\ R => #m.(m : M & (m'vrnd = k(M, Q, i)
	 & m'pval = v
	 & m'acc = a)))));
 SafeSet(M,Q,i) == (%t_.( t_ = 0 & k(M, Q, i) = 0 | PVal )\/%t_.( t_ = 0 & not(k(M, Q, i) = 0) | (%t_.( t_ = 0 & #v.(v : Vk(M, Q, i) & Only(v, M, Q, i)) | {v1} )\/%t_.( t_ = 0 & not(#v.(v : Vk(M, Q, i) & Only(v, M, Q, i))) | PVal ))(0) ))(0);

 Phase2a(i,va) == not(#m.(m : sentMsg & (m'type = "phase2a" & m'rnd = i)))
	 & #Q.(Q : Quorum(i) & (!a.(a : Q => #m.(m : sentMsg & (m'type = "phase1b"
	 & m'rnd = i
	 & m'acc = a)))
	 & (va : SafeSet(P1bMsg(Q, i), Q, i)
	 & #m.(m : sentMsg & (m'type : {"propose", "phase1b"}
	 & m'pval = va))
	 or (SafeSet(P1bMsg(Q, i), Q, i) = PVal
	 & i : FastNum
	 & va = any))))
	 & Send(rec(type : "phase2a",rnd : i,pval : va,acc : noVal2,vrnd : 0))
	 & TRUE = TRUE;

 Phase2b(i,a,v) == preceq(rnd(a), i)
	 & prec(vrnd(a), i)
	 & #m.(m : sentMsg & (m'type = "phase2a"
	 & m'rnd = i
	 & (m'pval = v
	 or (m'pval = any
	 & #mm.(mm : sentMsg & (mm'type = "propose" & mm'pval = v))))))
	 & rnd_n = rnd <+ {a |-> i}
	 & vrnd_n = vrnd <+ {a |-> i}
	 & pval_n = pval <+ {a |-> v}
	 & Send(rec(type : "phase2b",rnd : i,pval : v,acc : a,vrnd : 0))
	 & TRUE = TRUE;

 Learn(v) == #i.(i : RNum & #Q.(Q : Quorum(i) & !a.(a : Q => #m.(m : sentMsg & (m'type = "phase2b"
	 & m'rnd = i
	 & m'pval = v
	 & m'acc = a)))))
	 & learned_n = learned \/ {v}
	 & TRUE = TRUE;

 iMsg(Q, i) == {m|m : sentMsg & m'type = "phase2b" & m'rnd = i & m'acc : Q};
 P2bToP1b(Q,i) == {t_|#m.(m : iMsg(Q, i) & t_ = rec(type : "phase1b",rnd : NextNum(i),vrnd : i,pval : m'pval,acc : m'acc))};

 LeaderRecovery(i,v) == not(#m.(m : sentMsg & (m'type = "phase2a" & m'rnd = NextNum(i))))
	 & #Q.(Q : Quorum(i) & (!a.(a : Q => #m.(m : P2bToP1b(Q, i) & m'acc = a))
	 & v : SafeSet(P2bToP1b(Q, i), Q, NextNum(i))
	 & #m.(m : P2bToP1b(Q, i) & m'pval = v)))
	 & Send(rec(type : "phase2a",rnd : NextNum(i),pval : v,acc : noVal2,vrnd : 0))
	 & TRUE = TRUE;

 LeaderlessRecovery(i,a,v) == NextNum(i) : FastNum
	 & rnd(a) = i
	 & vrnd(a) = i
	 & #Q.(Q : Quorum(i) & (!b.(b : Q => #m.(m : P2bToP1b(Q, i) & m'acc = b))
	 & v : SafeSet(P2bToP1b(Q, i), Q, NextNum(i))
	 & #m.(m : P2bToP1b(Q, i) & m'pval = v)))
	 & rnd_n = rnd <+ {a |-> NextNum(i)}
	 & vrnd_n = vrnd <+ {a |-> NextNum(i)}
	 & pval_n = pval <+ {a |-> v}
	 & Send(rec(type : "phase2b",rnd : NextNum(i),pval : v,acc : a,vrnd : 0))
	 & TRUE = TRUE
VARIABLES rnd, vrnd, pval, sentMsg, learned
INVARIANT
 rnd : POW(ENUM2*INTEGER)
 & vrnd : POW(ENUM2*INTEGER)
 & pval : POW(ENUM2*ENUM1)
 & sentMsg : POW(struct(type:STRING,rnd:INTEGER,pval:ENUM1,acc:ENUM2,vrnd:INTEGER))
 & learned : POW(ENUM1)
 & TypeOK
INITIALISATION
 rnd, vrnd, pval, sentMsg, learned:(rnd = %a.(a : Acceptor| 0)
 & vrnd = %a.(a : Acceptor| 0)
 & pval = %a.(a : Acceptor| any)
 & sentMsg = {}
 & learned = {})
OPERATIONS
 Propose_Op(v) = ANY sentMsg_n
	WHERE v : PVal & 
	 sentMsg_n : POW(struct(type:STRING,rnd:INTEGER,pval:ENUM1,acc:ENUM2,vrnd:INTEGER)) & Propose(v)
	THEN sentMsg := sentMsg_n END;

 Learn_Op(v) = ANY learned_n
	WHERE v : PVal & 
	 learned_n : POW(ENUM1) & Learn(v)
	THEN learned := learned_n END;

 Phase1a_Op(i) = ANY sentMsg_n
	WHERE i : RNum & 
	 sentMsg_n : POW(struct(type:STRING,rnd:INTEGER,pval:ENUM1,acc:ENUM2,vrnd:INTEGER)) & Phase1a(i)
	THEN sentMsg := sentMsg_n END;

 Phase1b_Op(i, a) = ANY rnd_n, sentMsg_n
	WHERE i : RNum & a : Acceptor & 
	 rnd_n : POW(ENUM2*INTEGER) & sentMsg_n : POW(struct(type:STRING,rnd:INTEGER,pval:ENUM1,acc:ENUM2,vrnd:INTEGER)) & Phase1b(a, i)
	THEN rnd, sentMsg := rnd_n, sentMsg_n END;

 Phase2b_Op(i, a, v) = ANY rnd_n, vrnd_n, pval_n, sentMsg_n
	WHERE i : RNum & a : Acceptor & v : PVal & 
	 rnd_n : POW(ENUM2*INTEGER) & vrnd_n : POW(ENUM2*INTEGER) & pval_n : POW(ENUM2*ENUM1) & sentMsg_n : POW(struct(type:STRING,rnd:INTEGER,pval:ENUM1,acc:ENUM2,vrnd:INTEGER)) & Phase2b(i, a, v)
	THEN rnd, vrnd, pval, sentMsg := rnd_n, vrnd_n, pval_n, sentMsg_n END;

 Phase2a_Op(i, va) = ANY sentMsg_n
	WHERE i : RNum & va : PVal \/ {any} & 
	 sentMsg_n : POW(struct(type:STRING,rnd:INTEGER,pval:ENUM1,acc:ENUM2,vrnd:INTEGER)) & Phase2a(i, va)
	THEN sentMsg := sentMsg_n END;

 LeaderRecovery_Op(i, v) = ANY sentMsg_n
	WHERE i : FastNum & v : PVal & 
	 sentMsg_n : POW(struct(type:STRING,rnd:INTEGER,pval:ENUM1,acc:ENUM2,vrnd:INTEGER)) & LeaderRecovery(i, v)
	THEN sentMsg := sentMsg_n END;

 LeaderlessRecovery_Op(i, v, a) = ANY rnd_n, vrnd_n, pval_n, sentMsg_n
	WHERE i : FastNum & v : PVal & a : Acceptor & 
	 rnd_n : POW(ENUM2*INTEGER) & vrnd_n : POW(ENUM2*INTEGER) & pval_n : POW(ENUM2*ENUM1) & sentMsg_n : POW(struct(type:STRING,rnd:INTEGER,pval:ENUM1,acc:ENUM2,vrnd:INTEGER)) & LeaderlessRecovery(i, a, v)
	THEN rnd, vrnd, pval, sentMsg := rnd_n, vrnd_n, pval_n, sentMsg_n END
END
