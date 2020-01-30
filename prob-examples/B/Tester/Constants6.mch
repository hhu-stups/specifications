MACHINE Constants6
SETS
	IDS = {a,b,c,d}; PERSONS = {p1,p2,p3}
CONSTANTS
	minnr, mxnr, root, pid, pnr
PROPERTIES
        minnr:NATURAL &
	mxnr:NATURAL1 &
        root:IDS &
        pid : PERSONS >-> IDS &
        pnr : PERSONS >-> minnr..mxnr
// will be added by -property command in test 1779:
//& minnr = 7 & mxnr =9 & pid(p1) = a & pid(p2)=b & pid(p3)=c & pnr(p1)=minnr & pnr(p3)=mxnr & root=a
OPERATIONS
   i,n <-- Get(p) = PRE p:PERSONS THEN i,n := pid(p),pnr(p) END;
   sze,m <-- GetSze = BEGIN sze := 1 + mxnr - minnr || m:=minnr END
END