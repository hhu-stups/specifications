MODEL earley_3
SETS S={Init,Expr,Term,Factor,plus,mult,number};P={axiom,Pr2,Pr3,Pr4,Pr5,Pr6}
CONSTANTS N,cleft,cright,csize,input,s
PROPERTIES 
/* (axiom : P) & (Init /= Expr) & (Init /= Term) & (Init /= Factor) & (Init /= plus) & (Init /= mult) & (Init /= number) & (Expr /= Term) & (Expr /= Factor) & (Expr /= plus) & (Expr /= mult) & (Expr /= number) & (Term /= Factor) & (Term /= plus) & (Term /= mult) & (Term /= number) & (Factor /= plus) & (Factor /= mult) & (Factor /= number) & (plus /= mult) & (plus /= number) & (mult /= number) & (axiom /= Pr2) & (axiom /= Pr3) & (axiom /= Pr4) & (axiom /= Pr5) & (axiom /= Pr6) & (Pr2 /= Pr3) & (Pr2 /= Pr4) & (Pr2 /= Pr5) & (Pr2 /= Pr6) & (Pr3 /= Pr4) & (Pr3 /= Pr5) & (Pr3 /= Pr6) & (Pr4 /= Pr5) & (Pr4 /= Pr6) & (Pr5 /= Pr6) & */
(N = {Init,Expr,Term,Factor}) & (s = 5) & (input = {(1 |-> number),(2 |-> plus),(3 |-> number),(4 |-> mult),(5 |-> number)}) & (cleft = {(axiom |-> Init),(Pr2 |-> Expr),(Pr3 |-> Expr),(Pr4 |-> Term),(Pr5 |-> Term),(Pr6 |-> Factor)}) & (csize = {(axiom |-> 1),(Pr2 |-> 1),(Pr3 |-> 3),(Pr4 |-> 1),(Pr5 |-> 3),(Pr6 |-> 1)}) & (cright = {(axiom |-> {(1 |-> Expr)}),(Pr2 |-> {(1 |-> Term)}),(Pr3 |-> {(1 |-> Expr),(2 |-> plus),(3 |-> Term)}),(Pr4 |-> {(1 |-> Factor)}),(Pr5 |-> {(1 |-> Term),(2 |-> mult),(3 |-> Factor)}),(Pr6 |-> {(1 |-> number)})})
&
(N <: S) & (s : NATURAL) & (input : ((1 .. s) --> (S - N))) & (cleft : (P --> N)) & (csize : (P --> NATURAL1)) & (cright : (P --> (NATURAL +-> S))) & ! p.((p : P) => (cright(p) : ((1 .. (csize(p) + 0)) --> S))) 
VARIABLES index_input,index_lists,lists,return,size_l
INVARIANT (return : BOOL) & (lists : ((0 .. s) --> (NATURAL +-> ((P * NATURAL) * NATURAL)))) & (size_l : ((0 .. s) --> NATURAL)) & ! j.((j : INTEGER) => ((j : (0 .. s)) => (lists(j) : ((1 .. (0 + size_l(j))) >-> ((P * NATURAL) * NATURAL))))) & (index_input : (0 .. s)) & (index_lists : (1 .. (size_l(index_input) + 1)))

DEFINITIONS
/* SIMPLIFIED_INV_OP_selector == (index_lists : (1 .. (size_l(index_input) + 1)));
SIMPLIFIED_INV_OP_move_completer == (TRUE=TRUE);
SIMPLIFIED_INV_OP_completer == (index_lists : (1 .. (size_l(index_input) + 1)));
SIMPLIFIED_INV_OP_move_predictor == (index_lists : (1 .. (size_l(index_input) + 1)));
SIMPLIFIED_INV_OP_predictor == (index_lists : (1 .. (size_l(index_input) + 1)));
SIMPLIFIED_INV_OP_INITIALISATION == (TRUE=TRUE);
SIMPLIFIED_INV_OP_mover == (TRUE=TRUE);
*/
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION return := FALSE || lists := (((1 .. s) * {{}}) <+ {(0 |-> {(1 |-> ((axiom |-> 0) |-> 0))})}) || size_l := (((1 .. s) * {0}) <+ {(0 |-> 1)}) || index_input := 0 || index_lists := 1
OPERATIONS
 selector = ANY i,k,p WHERE (index_lists <= size_l(index_input)) & (((p |-> k) |-> i) = lists(index_input)(index_lists)) & (k < csize(p)) & (index_input < s) & (cright(p)((k + 1)) = input((index_input + 1))) & (((p |-> (k + 1)) |-> i) /: ran(lists((index_input + 1)))) & ((i : NATURAL) & (k : NATURAL) & (p : P)) THEN lists := (lists <+ {((index_input + 1) |-> (lists((index_input + 1)) \/ {((size_l((index_input + 1)) + 1) |-> ((p |-> (k + 1)) |-> i))}))}) || size_l := (size_l <+ {((index_input + 1) |-> (size_l((index_input + 1)) + 1))}) || index_lists := (index_lists + 1) END ;
 predictor = ANY i,k,p,q WHERE (index_lists <= size_l(index_input)) & (((p |-> k) |-> i) = lists(index_input)(index_lists)) & (k < csize(p)) & (cleft(q) = cright(p)((k + 1))) & (((q |-> 0) |-> index_input) /: ran(lists(index_input))) & ((i : NATURAL) & (k : NATURAL) & (p : P) & (q : P)) THEN lists := (lists <+ {(index_input |-> (lists(index_input) \/ {((size_l(index_input) + 1) |-> ((q |-> 0) |-> index_input))}))}) || size_l := (size_l <+ {(index_input |-> (size_l(index_input) + 1))}) END ;
 move_predictor = ANY i,k,p WHERE (index_lists <= size_l(index_input)) & (((p |-> k) |-> i) = lists(index_input)(index_lists)) & (k < csize(p)) & (cright(p)((k + 1)) : N) & ! q.((q : P) => ((cleft(q) = cright(p)((k + 1))) => (((q |-> 0) |-> index_input) : ran(lists(index_input))))) & ((i : NATURAL) & (k : NATURAL) & (p : P)) THEN index_lists := (index_lists + 1) END ;
 completer = ANY i,ip,k,kp,p,q WHERE (index_lists <= size_l(index_input)) & (((p |-> k) |-> i) = lists(index_input)(index_lists)) & (k = csize(p)) & (((q |-> kp) |-> ip) : ran(lists(i))) & (kp < csize(q)) & (cright(q)((kp + 1)) = cleft(p)) & (((q |-> (kp + 1)) |-> ip) /: ran(lists(index_input))) & ((i : NATURAL) & (k : NATURAL) & (p : P) & (q : P) & (ip : NATURAL) & (kp : NATURAL)) THEN lists := (lists <+ {(index_input |-> (lists(index_input) \/ {((size_l(index_input) + 1) |-> ((q |-> (kp + 1)) |-> ip))}))}) || size_l := (size_l <+ {(index_input |-> (size_l(index_input) + 1))}) END ;
 move_completer = ANY i,k,p WHERE (index_lists <= size_l(index_input)) & (((p |-> k) |-> i) = lists(index_input)(index_lists)) & (k = csize(p)) & ! (q,kp,ip).((q : P & kp : INTEGER & ip : INTEGER) => (((((q |-> kp) |-> ip) : ran(lists(i))) & (kp < csize(q)) & (cright(q)((kp + 1)) = cleft(p))) => (((q |-> (kp + 1)) |-> ip) : ran(lists(index_input))))) & ((i : NATURAL) & (k : NATURAL) & (p : P)) THEN index_lists := (index_lists + 1) END ;
 final = SELECT (((axiom |-> csize(axiom)) |-> 0) : ran(lists(s))) THEN return := TRUE END ;
 mover = SELECT (index_lists = (size_l(index_input) + 1)) & (index_input < s) THEN index_input := (index_input + 1) || index_lists := 1 END 
END