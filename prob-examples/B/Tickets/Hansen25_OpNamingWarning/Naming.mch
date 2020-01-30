MACHINE Naming
VARIABLES yy
INVARIANT
 yy:INTEGER
INITIALISATION yy:=0
OPERATIONS
res<--foo = BEGIN VAR res IN res := 1 END; res := 1 END
;
res1<--bar = BEGIN ANY res1 WHERE res1 : 1..10 THEN skip END; res1 := 1 END;

 op(xx) = PRE xx:NAT THEN
       ANY xx WHERE xx:POW(NAT) THEN skip END
       END;
   opl(xx) = PRE xx:NAT THEN
         LET xx BE xx=10 IN skip END
         END;
   opl2(xx) = PRE xx:NAT THEN
         LET yy BE yy=10 IN skip END
         END
END

/*
Error message was only produced for bar not for foo:

! An error occurred !
! source(type_error)
! Identifier res1 has already been declared at (line:column) = (5:0)
! Line: 5 Column: 23 in file: /Users/leuschel/git_root/prob_examples/public_examples/B/Tickets/Hansen25_OpNamingWarning/Naming.mch

*/