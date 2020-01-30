MACHINE monitor2

SETS
    Staff = {john,peter,mary,michael}

DEFINITIONS
    /* scope_Staff == 1..4 ; */
    max_user == 3

VARIABLES in,out,users

INVARIANT
        in    : POW(Staff)  &
        out   : POW(Staff)  &
        users : POW(Staff)  &
        in /\ out = {} &
        in \/ out = users &
        card(in) <= max_user

INITIALISATION
    in,out,users := {},{},{}

OPERATIONS

enter(ss) =
    PRE
        ss : out & card(in) < max_user
    THEN
        in:=in\/{ss}  ||  out:=out-{ss}
    END;


leave(ss) =
    PRE
        ss : in
    THEN
        in:=in-{ss}  ||  out:=out\/{ss}
    END;

ss1 <-- newuser =
    ANY ss WHERE
        (ss:Staff)  &  (ss /: users)
    THEN
        users:=users\/{ss}  ||  out:=out\/{ss} ||
        ss1 := ss
    END;


removeuser(ss) =
    PRE
        ss : users
    THEN
        users:=users-{ss}  ||
         IF ss:in
         THEN  in:=in-{ss}
         ELSE out:=out-{ss}
         END
    END

END

